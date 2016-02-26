import numpy as np
import pandas as pd
import re

county_facts = pd.read_csv("input/county_facts/county_facts.csv", dtype={"fips": np.str})

fips_county = open("input/county_facts/fips_county.txt", encoding="latin-1").readlines()
fips_county = [[line[:5],
               re.findall(r"^(.*),", line[6:])[0] if "," in line[6:] else line[6:].strip().title(),
               re.findall(r", ([A-Z][A-Z])$", line[6:])[0] if "," in line[6:] else ""]
               for line in fips_county]
fips_county = pd.DataFrame(fips_county, columns=["fips", "area_name", "state_abbreviation"])
county_facts = fips_county.merge(county_facts, on="fips")
county_facts["fips"] = county_facts["fips"].astype(np.int64)

county_facts.to_csv("output/county_facts.csv", index=False)

county_facts_dictionary = open("input/county_facts/dictionary.txt").readlines()[2:]
county_facts_dictionary = [[line[:9].strip(),
                            line[10:97].strip()]
                           for line in county_facts_dictionary]
county_facts_dictionary = pd.DataFrame(county_facts_dictionary, columns=["column_name", "description"])
county_facts_dictionary.to_csv("output/county_facts_dictionary.csv", index=False)
