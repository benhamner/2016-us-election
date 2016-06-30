import json
from openpyxl import load_workbook
import pandas as pd

def json_to_dataframe(data):
    return pd.DataFrame([[county["name"],
                         candidate["fname"]+" "+candidate["lname"],
                         candidate["votes"],
                         float(candidate["pctDecimal"])/100]
                        for county in data["counties"]
                        for candidate in county["race"]["candidates"]],
                        columns=["county", "candidate", "votes", "fraction_votes"])

completed_races = [["Alabama",        "AL", "Republican"],
                   ["Alabama",        "AL", "Democrat"],
                   ["Alaska",         "AK", "Republican"],
                   ["Alaska",         "AK", "Democrat"],
                   ["Arizona",        "AZ", "Republican"],
                   ["Arizona",        "AZ", "Democrat"],
                   ["Arkansas",       "AR", "Republican"],
                   ["Arkansas",       "AR", "Democrat"],
                   ["California",     "CA", "Republican"],
                   ["California",     "CA", "Democrat"],
# CO Republican - no county-level results on CNN. TODO: investigate
                   ["Colorado",       "CO", "Democrat"],
                   ["Connecticut",    "CT", "Republican"],
                   ["Connecticut",    "CT", "Democrat"],
                   ["Florida",        "FL", "Republican"],
                   ["Florida",        "FL", "Democrat"],
                   ["Delaware",       "DE", "Republican"],
                   ["Delaware",       "DE", "Democrat"],
                   ["Georgia",        "GA", "Republican"],
                   ["Georgia",        "GA", "Democrat"],
                   ["Hawaii",         "HI", "Republican"],
                   ["Hawaii",         "HI", "Democrat"],
                   ["Idaho",          "ID", "Republican"],
                   ["Idaho",          "ID", "Democrat"],
                   ["Illinois",       "IL", "Republican"],
                   ["Illinois",       "IL", "Democrat"],
                   ["Indiana",        "IN", "Republican"],
                   ["Indiana",        "IN", "Democrat"],
                   ["Iowa",           "IA", "Republican"],
                   ["Iowa",           "IA", "Democrat"],
                   ["Kansas",         "KS", "Republican"],
                   ["Kansas",         "KS", "Democrat"],
                   ["Kentucky",       "KY", "Republican"],
                   ["Kentucky",       "KY", "Democrat"],
                   ["Louisiana",      "LA", "Republican"],
                   ["Louisiana",      "LA", "Democrat"],
#                   ["Maine",          "ME", "Republican"], Something wrong here
                   ["Maine",          "ME", "Democrat"],
                   ["Maryland",       "MD", "Republican"],
                   ["Maryland",       "MD", "Democrat"],
                   ["Massachusetts",  "MA", "Republican"],
                   ["Massachusetts",  "MA", "Democrat"],
                   ["Michigan",       "MI", "Republican"],
                   ["Michigan",       "MI", "Democrat"],
# TODO: Revisit Minnesota - something's weird here
                   ["Mississippi",    "MS", "Republican"],
                   ["Mississippi",    "MS", "Democrat"],
                   ["Missouri",       "MO", "Republican"],
                   ["Missouri",       "MO", "Democrat"],
                   ["Montana",        "MT", "Republican"],
                   ["Montana",        "MT", "Democrat"],
                   ["Nebraska",       "NE", "Republican"],
                   ["Nebraska",       "NE", "Democrat"],
                   ["Nevada",         "NV", "Republican"],
                   ["Nevada",         "NV", "Democrat"],
# CNN data reports city-level results for NH, so we'll use a different data source here
#                   ["New Hampshire", "NH", "Republican"], 
#                   ["New Hampshire", "NH", "Democrat"],
                   ["New Jersey",     "NJ", "Republican"],
                   ["New Jersey",     "NJ", "Democrat"],
                   ["New Mexico",     "NM", "Republican"],
                   ["New Mexico",     "NM", "Democrat"],
                   ["New York",       "NY", "Republican"],
                   ["New York",       "NY", "Democrat"],
                   ["North Carolina", "NC", "Republican"],
                   ["North Carolina", "NC", "Democrat"],
# ND republican - no county-level results on CNN. TODO: investigate
                   ["North Dakota",   "ND", "Democrat"],
                   ["Ohio",           "OH", "Republican"],
                   ["Ohio",           "OH", "Democrat"],
                   ["Oklahoma",       "OK", "Republican"],
                   ["Oklahoma",       "OK", "Democrat"],
                   ["Oregon",         "OR", "Republican"],
                   ["Oregon",         "OR", "Democrat"],
                   ["Pennsylvania",   "PA", "Republican"],
                   ["Pennsylvania",   "PA", "Democrat"],
                   ["Rhode Island",   "RI", "Republican"],
                   ["Rhode Island",   "RI", "Democrat"],
                   ["South Carolina", "SC", "Republican"],
                   ["South Carolina", "SC", "Democrat"],
                   ["South Dakota",   "SD", "Republican"],
                   ["South Dakota",   "SD", "Democrat"],
                   ["Tennessee",      "TN", "Republican"],
                   ["Tennessee",      "TN", "Democrat"],
                   ["Texas",          "TX", "Republican"],
                   ["Texas",          "TX", "Democrat"],
                   ["Utah",           "UT", "Republican"],
                   ["Utah",           "UT", "Democrat"],
                   ["Vermont",        "VT", "Republican"],
                   ["Vermont",        "VT", "Democrat"],
                   ["Virginia",       "VA", "Republican"],
                   ["Virginia",       "VA", "Democrat"],
                   ["Washington",     "WA", "Republican"],
                   ["Washington",     "WA", "Democrat"],
                   ["West Virginia",  "WV", "Republican"],
                   ["West Virginia",  "WV", "Democrat"],
                   ["Wisconsin",      "WI", "Republican"],
                   ["Wisconsin",      "WI", "Democrat"],
                   ["Wyoming",        "WY", "Republican"],
                   ["Wyoming",        "WY", "Democrat"]]

results = []

for race in completed_races:
    file_name = "_".join([x.lower() for x in race[0].split(" ")]) + "_" + race[2].lower() + ".json"
    print(file_name)
    race_data = json_to_dataframe(json.loads(open("input/state_results/" + file_name).read()))
    race_data["state"] = race[0]
    race_data["state_abbreviation"] = race[1]
    race_data["party"] = race[2]
    results.append(race_data)

# New Hampshire data
wb = load_workbook(filename='input/state_results/new_hampshire.xlsx')

dem_ws = wb["D by County"]
democratic_data = []
for row in dem_ws.rows[1:]:
    democratic_data.append([cell.value for cell in row])
democratic_data = pd.DataFrame(democratic_data, columns=[cell.value for cell in dem_ws.rows[0]])
democratic_data = pd.melt(democratic_data, id_vars="County", var_name="Candidate", value_name="Votes")
democratic_data["party"] = "Democrat"

rep_ws = wb["R by County"]
republican_data = []
for row in rep_ws.rows[1:]:
    republican_data.append([cell.value for cell in row])
republican_data = pd.DataFrame(republican_data, columns=[cell.value for cell in rep_ws.rows[0]])
republican_data = pd.melt(republican_data, id_vars="County", var_name="Candidate", value_name="Votes")
republican_data["party"] = "Republican"

new_hampshire_data = pd.concat([democratic_data, republican_data], ignore_index=True)

new_hampshire_data["fraction_votes"] = 0.0

for i in range(len(new_hampshire_data)):
    party = new_hampshire_data.ix[i, "party"]
    county = new_hampshire_data.ix[i, "County"]
    party_county_votes = new_hampshire_data[(new_hampshire_data["party"]==party) & (new_hampshire_data["County"]==county)]["Votes"].sum()
    new_hampshire_data.ix[i, "fraction_votes"] = new_hampshire_data.ix[i, "Votes"]/party_county_votes

new_hampshire_data["state"] = "New Hampshire"
new_hampshire_data["state_abbreviation"] = "NH"
new_hampshire_data = new_hampshire_data.rename(columns={"Votes": "votes", "County": "county", "Candidate": "candidate"})
results.append(new_hampshire_data)

county_fips = pd.read_csv("input/county_fips.csv")

primary_results = pd.concat(results, ignore_index=True)
primary_results["polyname"] = [primary_results.ix[i, "state"].lower() + "," + primary_results.ix[i, "county"].lower()
                               for i in range(len(primary_results))]
primary_results = primary_results.merge(county_fips, on="polyname")
primary_results = primary_results[["state","state_abbreviation","county","fips","party","candidate","votes","fraction_votes"]]
primary_results = primary_results.sort_values(["state", "party", "county", "candidate"])
primary_results.to_csv("output/primary_results.csv", index=False)
