input/state_results/Iowa.xlsx:
	mkdir -p input/state_results
	curl http://overflow.solutions/wp-content/uploads/2016/02/2016-Iowa-Caucus-Results-Dem-and-Rep-2-2-2016.xlsx -o input/state_results/Iowa.xlsx

input/state_results/NewHampshire.xlsx:
	mkdir -p input/state_results
	curl https://numeracy.co/projects/2n9KPEk6ShS/versions/2?format=xlsx -o input/state_results/NewHampshire.xlsx

input/county_shapefiles/.sentinel:
	mkdir -p input/county_shapefiles
	curl http://www2.census.gov/geo/tiger/GENZ2014/shp/cb_2014_us_county_500k.zip -o input/county_shapefiles/500k.zip
	curl http://www2.census.gov/geo/tiger/GENZ2014/shp/cb_2014_us_county_5m.zip -o input/county_shapefiles/5m.zip
	curl http://www2.census.gov/geo/tiger/GENZ2014/shp/cb_2014_us_county_20m.zip -o input/county_shapefiles/20m.zip
	cd input/county_shapefiles; unzip \*.zip
	touch input/county_shapefiles/.sentinel

input: input/county_shapefiles/.sentinel input/state_results/Iowa.xlsx input/state_results/NewHampshire.xlsx

working/state_results/Iowa.csv: input/state_results/Iowa.xlsx
	mkdir -p working/state_results
	python src/iowa.py
iowa: working/state_results/Iowa.csv

working/state_results/NewHampshire.csv: input/state_results/NewHampshire.xlsx
	mkdir -p working/state_results
	python src/new_hampshire.py
new-hampshire: working/state_results/NewHampshire.csv

output/PrimaryResults.csv: working/state_results/Iowa.csv working/state_results/NewHampshire.csv
	mkdir -p output
	python src/primary_results.py
primary-results: output/PrimaryResults.csv

working/no_header/PrimaryResults.csv: output/PrimaryResults.csv
	mkdir -p working/no_header
	tail +2 $^ > $@

output/database.sqlite: working/no_header/PrimaryResults.csv
	-rm output/database.sqlite
	sqlite3 -echo $@ < src/import.sql
db: output/database.sqlite

output/county_shapefiles/cb_2014_us_county_500k.shp: input/county_shapefiles/.sentinel
	mkdir -p output/county_shapefiles
	cp -r input/county_shapefiles output/
	rm output/county_shapefiles/*.zip
	rm output/county_shapefiles/.sentinel

output/hashes.txt: output/database.sqlite output/county_shapefiles/cb_2014_us_county_500k.shp
	-rm output/hashes.txt
	echo "Current git commit:" >> output/hashes.txt
	git rev-parse HEAD >> output/hashes.txt
	echo "\nCurrent input/ouput md5 hashes:" >> output/hashes.txt
	md5 output/*.csv >> output/hashes.txt
	md5 output/*.sqlite >> output/hashes.txt
	md5 output/county_shapefiles/* >> output/hashes.txt
	md5 input/state_results/* >> output/hashes.txt
	md5 input/county_shapefiles/* >> output/hashes.txt
hashes: output/hashes.txt

release: output/hashes.txt
	cp -r output 2016-presidential-election
	zip -r -X output/2016-presidential-election-`date -u +'%Y-%m-%d-%H-%M-%S'` 2016-presidential-election/*
	rm -rf 2016-presidential-election

all: release

clean:
	rm -rf working
	rm -rf output
