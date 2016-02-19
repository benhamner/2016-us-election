import pandas as pd

primary_results = []

primary_results.append(pd.read_csv("working/stateResults/Iowa.csv"))
primary_results.append(pd.read_csv("working/stateResults/NewHampshire.csv"))

primary_results = pd.concat(primary_results, ignore_index=True)
primary_results = primary_results[["StateName","StateAbbreviation","County","Party","Candidate","Votes","FractionVotes"]]
primary_results.to_csv("output/PrimaryResults.csv", index=False)
