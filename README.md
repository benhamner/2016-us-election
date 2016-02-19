#  2016-presidential-election

This contains the code to clean and create the [2016 US Election](https://www.kaggle.com/benhamner/2016-us-election) dataset on [Kaggle](https://www.kaggle.com)

It requires Python 3, and you can re-create the data release by running `make all` from the root directory.

[![nh-dem](https://www.kaggle.io/svf/162809/cf105fb56b206d457b5bde1a8e546365/New%20Hampshire_Democrat.png)](https://www.kaggle.com/benhamner/d/benhamner/2016-us-election/new-hampshire-democratic-primary-results)

[![ia-rep](https://www.kaggle.io/svf/162801/87335e996f9415489f5088c670c34f29/Iowa_Republican.png)](https://www.kaggle.com/benhamner/d/benhamner/2016-us-election/iowa-republican-primary-results)

## Exploration Ideas

 - What candidates within the Republican party have results that are the most anti-correlated?
 - Which Republican candidate is Hillary Clinton most correlated with based on county voting patterns? What about Bernie Sanders?
 - What insights can you discover by mapping this data?

Do you have answers or other exploration ideas? Add your ideas to [this forum post](https://www.kaggle.com/forums/f/1078/2016-us-election/t/19071/exploration-ideas) and share your insights through [Kaggle Scripts](https://www.kaggle.com/benhamner/2016-us-election/scripts)!

Do you think that we should augment this dataset with more data sources? Submit a pull request to this repo, or [let us know here](https://www.kaggle.com/forums/f/1078/2016-us-election/t/19072/additional-data-sources)!

## Data Description

The 2016 US Election dataset contains several main files and folders at the moment. You may download the entire archive via the "Download Data" link at the top of the page, or interact with the data in Kaggle Scripts through the `../input` directory.

 - **[PrimaryResuts.csv](https://www.kaggle.com/benhamner/d/benhamner/2016-us-election/primary-results-sample-data)**: main primary results file
   - State: state where the primary or caucus was held
   - StateAbbreviation: two letter state abbreviation
   - County: county where the results come from
   - Party: Democrat or Republican
   - Candidate: name of the candidate
   - Votes: number of votes the candidate received in the corresponding state and county (may be missing)
   - FractionVotes: fraction of votes the president received in the corresponding state, county, and primary
 - **database.sqlite**: SQLite database containing the PrimaryResults table with identical data and schema
 - **county_shapefiles**: directory containing county shapefiles at three different resolutions for mapping

## Original Data Sources

 - [Iowa County-Level Results](http://overflow.solutions/datasets/2016-iowa-caucus-data-sets/)
 - [New Hampshire County-Level Results](https://numeracy.co/projects/2n9KPEk6ShS)
 - [County Shapefiles](https://www.census.gov/geo/maps-data/data/cbf/cbf_counties.html)
