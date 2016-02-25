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

sc_rep = json_to_dataframe(json.loads(open("input/state_results/south_carolina_republican.json").read()))
sc_rep["state"] = "South Carolina"
sc_rep["state_abbreviation"] = "SC"
sc_rep["party"] = "Republican"

nv_rep = json_to_dataframe(json.loads(open("input/state_results/nevada_republican.json").read()))
nv_rep["state"] = "Nevada"
nv_rep["state_abbreviation"] = "NV"
nv_rep["party"] = "Republican"

nv_dem = json_to_dataframe(json.loads(open("input/state_results/nevada_democrat.json").read()))
nv_dem["state"] = "Nevada"
nv_dem["state_abbreviation"] = "NV"
nv_dem["party"] = "Democrat"

other_data = pd.concat([sc_rep, nv_rep, nv_dem], ignore_index=True)

other_data.to_csv("working/state_results/other_states.csv", index=False)
