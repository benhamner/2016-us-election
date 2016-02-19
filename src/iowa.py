from openpyxl import load_workbook
import pandas as pd

wb = load_workbook(filename='input/state_results/Iowa.xlsx')

dem_ws = wb["Democratic Microdata"]
democratic_data = []
for row in dem_ws.rows[1:]:
    democratic_data.append([cell.value for cell in row])
democratic_data = pd.DataFrame(democratic_data, columns=["County", "Candidate", "FractionVotes"])
democratic_data["Party"] = "Democrat"

rep_ws = wb["Republican Microdata"]
republican_data = []
for row in rep_ws.rows[1:]:
    republican_data.append([cell.value for cell in row])
republican_data = pd.DataFrame(republican_data, columns=["County", "Votes", "FractionVotes", "Candidate"])
republican_data["Votes"] = republican_data["Votes"].astype("int").astype("str")
republican_data["Party"] = "Republican"

iowa_data = pd.concat([democratic_data, republican_data], ignore_index=True)
iowa_data["State"] = "Iowa"
iowa_data["StateAbbreviation"] = "IA"
iowa_data.to_csv("working/state_results/Iowa.csv", index=False)
