import pandas as pd

primary_results = []

primary_results.append(pd.read_csv("working/state_results/Iowa.csv"))
primary_results.append(pd.read_csv("working/state_results/NewHampshire.csv"))

primary_results = pd.concat(primary_results, ignore_index=True)
primary_results = primary_results[["State","StateAbbreviation","County","Party","Candidate","Votes","FractionVotes"]]
primary_results.to_csv("output/PrimaryResults.csv", index=False)
