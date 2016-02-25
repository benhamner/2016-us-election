import json
import pandas as pd

def json_to_dataframe(data):
    return pd.DataFrame([[county["name"],
                         candidate["fname"]+" "+candidate["lname"],
                         candidate["votes"],
                         float(candidate["pctDecimal"])]
                        for county in data["counties"]
                        for candidate in county["race"]["candidates"]],
                        columns=["county", "candidate", "votes", "fraction_votes"])

completed_races = [["Iowa", "IA", "Republican"],
                   ["Iowa", "IA", "Democrat"],
                   ["New Hampshire", "NH", "Republican"],
                   ["New Hampshire", "NH", "Democrat"],
                   ["Nevada", "NV", "Republican"],
                   ["Nevada", "NV", "Democrat"],
                   ["South Carolina", "SC", "Republican"]]

results = []

for race in completed_races:
    file_name = "_".join([x.lower() for x in race[0].split(" ")]) + "_" + race[2].lower() + ".json"
    print(file_name)
    race_data = json_to_dataframe(json.loads(open("input/state_results/" + file_name).read()))
    race_data["state"] = race[0]
    race_data["state_abbreviation"] = race[1]
    race_data["party"] = race[2]
    results.append(race_data)

primary_results = pd.concat(results, ignore_index=True)
primary_results = primary_results[["state","state_abbreviation","county","party","candidate","votes","fraction_votes"]]
primary_results.to_csv("output/primary_results.csv", index=False)
