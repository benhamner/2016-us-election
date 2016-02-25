input/state_results/.sentinel:
	curl http://data.cnn.com/ELECTION/2016primary/IA/county/S.json -o iowa_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/IA/county/E.json -o iowa_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/NH/county/S.json -o new_hampshire_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/NH/county/E.json -o new_hampshire_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/NV/county/S.json -o nevada_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/NV/county/E.json -o nevada_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/SC/county/S.json -o south_carolina_republican.json
	touch input/state_results/.sentinel

input/state_results/iowa.xlsx:
	mkdir -p input/state_results
	curl http://overflow.solutions/wp-content/uploads/2016/02/2016-Iowa-Caucus-Results-Dem-and-Rep-2-2-2016.xlsx -o input/state_results/iowa.xlsx

input/state_results/new_hampshire.xlsx:
	mkdir -p input/state_results
	curl https://numeracy.co/projects/2n9KPEk6ShS/versions/2?format=xlsx -o input/state_results/new_hampshire.xlsx

input/county_shapefiles/.sentinel:
	mkdir -p input/county_shapefiles
	curl http://www2.census.gov/geo/tiger/GENZ2014/shp/cb_2014_us_county_500k.zip -o input/county_shapefiles/500k.zip
	curl http://www2.census.gov/geo/tiger/GENZ2014/shp/cb_2014_us_county_5m.zip -o input/county_shapefiles/5m.zip
	curl http://www2.census.gov/geo/tiger/GENZ2014/shp/cb_2014_us_county_20m.zip -o input/county_shapefiles/20m.zip
	cd input/county_shapefiles; unzip \*.zip
	touch input/county_shapefiles/.sentinel

input/county_facts/.sentinel:
	mkdir -p input/county_facts
	curl http://quickfacts.census.gov/qfd/download/DataSet.txt -o input/county_facts/county_facts.csv
	curl http://quickfacts.census.gov/qfd/download/FIPS_CountyName.txt -o input/county_facts/fips_county.txt
	curl http://quickfacts.census.gov/qfd/download/DataDict.txt -o input/county_facts/dictionary.txt
	touch input/county_facts/.sentinel

input: input/county_shapefiles/.sentinel input/county_facts/.sentinel input/state_results/.sentinel input/state_results/iowa.xlsx input/state_results/new_hampshire.xlsx

working/state_results/iowa.csv: input/state_results/iowa.xlsx
	mkdir -p working/state_results
	python src/iowa.py
iowa: working/state_results/iowa.csv

working/state_results/new_hampshire.csv: input/state_results/new_hampshire.xlsx
	mkdir -p working/state_results
	python src/new_hampshire.py
new-hampshire: working/state_results/new_hampshire.csv

working/state_results/other_states.csv: input/state_results/south_carolina_republican.json input/state_results/nevada_republican.json input/state_results/nevada_democrat.json
	mkdir -p working/state_results
	python src/other_states.py

output/primary_results.csv: working/state_results/iowa.csv working/state_results/new_hampshire.csv working/state_results/other_states.csv
	mkdir -p output
	python src/primary_results.py
primary-results: output/primary_results.csv

output/county_facts.csv: input/county_facts/.sentinel
	python src/county_facts.py
output/county_facts_dictionary.csv: output/county_facts.csv

working/no_header/primary_results.csv: output/primary_results.csv
	mkdir -p working/no_header
	tail +2 $^ > $@

working/no_header/county_facts.csv: output/county_facts.csv
	mkdir -p working/no_header
	tail +2 $^ > $@

working/no_header/county_facts_dictionary.csv: output/county_facts_dictionary.csv
	mkdir -p working/no_header
	tail +2 $^ > $@

output/database.sqlite: working/no_header/primary_results.csv working/no_header/county_facts.csv working/no_header/county_facts_dictionary.csv
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
	md5 input/county_facts/* >> output/hashes.txt
hashes: output/hashes.txt

release: output/hashes.txt
	cp -r output 2016_presidential_election
	zip -r -X output/2016_presidential_election_`date -u +'%Y-%m-%d-%H-%M-%S'` 2016_presidential_election/*
	rm -rf 2016_presidential_election

all: release

clean:
	rm -rf working
	rm -rf output
