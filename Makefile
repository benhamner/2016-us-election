input/state_results/.sentinel:
	mkdir -p input/state_results
	curl http://data.cnn.com/ELECTION/2016primary/AL/county/R.json -o input/state_results/alabama_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/AL/county/D.json -o input/state_results/alabama_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/AK/county/S.json -o input/state_results/alaska_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/AZ/county/R.json -o input/state_results/arizona_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/AZ/county/D.json -o input/state_results/arizona_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/AR/county/R.json -o input/state_results/arkansas_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/AR/county/D.json -o input/state_results/arkansas_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/CO/county/E.json -o input/state_results/colorado_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/FL/county/R.json -o input/state_results/florida_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/FL/county/D.json -o input/state_results/florida_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/GA/county/R.json -o input/state_results/georgia_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/GA/county/D.json -o input/state_results/georgia_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/HI/county/S.json -o input/state_results/hawaii_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/IA/county/S.json -o input/state_results/iowa_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/IA/county/E.json -o input/state_results/iowa_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/ID/county/R.json -o input/state_results/idaho_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/ID/county/E.json -o input/state_results/idaho_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/IL/county/R.json -o input/state_results/illinois_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/IL/county/D.json -o input/state_results/illinois_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/KS/county/S.json -o input/state_results/kansas_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/KS/county/E.json -o input/state_results/kansas_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/KY/county/S.json -o input/state_results/kentucky_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/LA/county/R.json -o input/state_results/louisiana_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/LA/county/D.json -o input/state_results/louisiana_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/ME/county/S.json -o input/state_results/maine_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/ME/county/E.json -o input/state_results/maine_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/MA/county/R.json -o input/state_results/massachusetts_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/MA/county/D.json -o input/state_results/massachusetts_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/MI/county/R.json -o input/state_results/michigan_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/MI/county/D.json -o input/state_results/michigan_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/MS/county/R.json -o input/state_results/mississippi_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/MS/county/D.json -o input/state_results/mississippi_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/MO/county/R.json -o input/state_results/missouri_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/MO/county/D.json -o input/state_results/missouri_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/NE/county/E.json -o input/state_results/nebraska_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/NV/county/S.json -o input/state_results/nevada_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/NV/county/E.json -o input/state_results/nevada_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/NH/county/R.json -o input/state_results/new_hampshire_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/NH/county/D.json -o input/state_results/new_hampshire_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/NC/county/R.json -o input/state_results/north_carolina_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/NC/county/D.json -o input/state_results/north_carolina_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/OH/county/R.json -o input/state_results/ohio_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/OH/county/D.json -o input/state_results/ohio_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/OK/county/R.json -o input/state_results/oklahoma_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/OK/county/D.json -o input/state_results/oklahoma_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/SC/county/R.json -o input/state_results/south_carolina_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/SC/county/D.json -o input/state_results/south_carolina_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/TN/county/R.json -o input/state_results/tennessee_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/TN/county/D.json -o input/state_results/tennessee_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/TX/county/R.json -o input/state_results/texas_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/TX/county/D.json -o input/state_results/texas_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/UT/county/S.json -o input/state_results/utah_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/UT/county/E.json -o input/state_results/utah_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/VT/county/R.json -o input/state_results/vermont_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/VT/county/D.json -o input/state_results/vermont_democrat.json
	curl http://data.cnn.com/ELECTION/2016primary/VA/county/R.json -o input/state_results/virginia_republican.json
	curl http://data.cnn.com/ELECTION/2016primary/VA/county/D.json -o input/state_results/virginia_democrat.json

	curl https://numeracy.co/projects/2n9KPEk6ShS/versions/2?format=xlsx -o input/state_results/new_hampshire.xlsx
	touch input/state_results/.sentinel

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

input/county_fips.csv:
	Rscript -e 'library(maps);library(readr);data(county.fips);write_csv(county.fips, "input/county_fips.csv")'

input: input/county_shapefiles/.sentinel input/county_facts/.sentinel input/state_results/.sentinel input/county_fips.csv

output/primary_results.csv: input/state_results/.sentinel input/county_fips.csv
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

clean-input-state-results:
	rm -rf input/state_results
