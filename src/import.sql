.separator ","

CREATE TABLE PrimaryResults (
    StateName TEXT,
    StateAbbreviation TEXT,
    County TEXT,
    Party TEXT,
    Candidate TEXT,
    Votes INTEGER,
    FractionVotes NUMERIC);

.import "working/no_header/PrimaryResults.csv" PrimaryResults
