import json
import pandas as pd

def json_to_dataframe(data):
    return pd.DataFrame([[county["name"],
                         candidate["fname"]+" "+candidate["lname"],
                         candidate["votes"],
                         float(candidate["pctDecimal"])]
                        for county in data["counties"]
                        for candidate in county["race"]["candidates"]],
                        columns=["County", "Candidate", "Votes", "FractionVotes"])

sc_rep = json_to_dataframe(json.loads(open("input/state_results/SouthCarolinaRepublican.json").read()))
sc_rep["State"] = "South Carolina"
sc_rep["StateAbbreviation"] = "SC"
sc_rep["Party"] = "Republican"

nv_rep = json_to_dataframe(json.loads(open("input/state_results/NevadaRepublican.json").read()))
nv_rep["State"] = "Nevada"
nv_rep["StateAbbreviation"] = "NV"
nv_rep["Party"] = "Republican"

nv_dem = json_to_dataframe(json.loads(open("input/state_results/NevadaDemocrat.json").read()))
nv_dem["State"] = "Nevada"
nv_dem["StateAbbreviation"] = "NV"
nv_dem["Party"] = "Democrat"

other_data = pd.concat([sc_rep, nv_rep, nv_dem], ignore_index=True)

other_data.to_csv("working/state_results/OtherStates.csv", index=False)
