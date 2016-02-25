from openpyxl import load_workbook
import pandas as pd

wb = load_workbook(filename='input/state_results/iowa.xlsx')

dem_ws = wb["Democratic Microdata"]
democratic_data = []
for row in dem_ws.rows[1:]:
    democratic_data.append([cell.value for cell in row])
democratic_data = pd.DataFrame(democratic_data, columns=["county", "candidate", "fraction_votes"])
democratic_data["party"] = "Democrat"

rep_ws = wb["Republican Microdata"]
republican_data = []
for row in rep_ws.rows[1:]:
    republican_data.append([cell.value for cell in row])
republican_data = pd.DataFrame(republican_data, columns=["county", "votes", "fraction_votes", "candidate"])
republican_data["votes"] = republican_data["votes"].astype("int").astype("str")
republican_data["party"] = "Republican"

iowa_data = pd.concat([democratic_data, republican_data], ignore_index=True)
iowa_data["state"] = "Iowa"
iowa_data["state_abbreviation"] = "IA"
iowa_data.to_csv("working/state_results/iowa.csv", index=False)
