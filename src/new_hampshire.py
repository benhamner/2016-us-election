from openpyxl import load_workbook
import pandas as pd

wb = load_workbook(filename='input/state_results/NewHampshire.xlsx')

dem_ws = wb["D by County"]
democratic_data = []
for row in dem_ws.rows[1:]:
    democratic_data.append([cell.value for cell in row])
democratic_data = pd.DataFrame(democratic_data, columns=[cell.value for cell in dem_ws.rows[0]])
democratic_data = pd.melt(democratic_data, id_vars="County", var_name="Candidate", value_name="Votes")
democratic_data["Party"] = "Democrat"

rep_ws = wb["R by County"]
republican_data = []
for row in rep_ws.rows[1:]:
    republican_data.append([cell.value for cell in row])
republican_data = pd.DataFrame(republican_data, columns=[cell.value for cell in rep_ws.rows[0]])
republican_data = pd.melt(republican_data, id_vars="County", var_name="Candidate", value_name="Votes")
republican_data["Party"] = "Republican"

new_hampshire_data = pd.concat([democratic_data, republican_data], ignore_index=True)

new_hampshire_data["FractionVotes"] = 0.0

for i in range(len(new_hampshire_data)):
    party = new_hampshire_data.ix[i, "Party"]
    county = new_hampshire_data.ix[i, "County"]
    party_county_votes = new_hampshire_data[(new_hampshire_data["Party"]==party) & (new_hampshire_data["County"]==county)]["Votes"].sum()
    new_hampshire_data.ix[i, "FractionVotes"] = new_hampshire_data.ix[i, "Votes"]/party_county_votes

new_hampshire_data["State"] = "New Hampshire"
new_hampshire_data["StateAbbreviation"] = "NH"
new_hampshire_data.to_csv("working/state_results/NewHampshire.csv", index=False)
