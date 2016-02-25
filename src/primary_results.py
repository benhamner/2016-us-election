import pandas as pd

primary_results = []

primary_results.append(pd.read_csv("working/state_results/iowa.csv"))
primary_results.append(pd.read_csv("working/state_results/new_hampshire.csv"))
primary_results.append(pd.read_csv("working/state_results/other_states.csv"))

primary_results = pd.concat(primary_results, ignore_index=True)
primary_results = primary_results[["state","state_abbreviation","county","party","candidate","votes","fraction_votes"]]
primary_results.to_csv("output/primary_results.csv", index=False)
