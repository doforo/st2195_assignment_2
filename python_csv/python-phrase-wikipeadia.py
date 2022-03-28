import requests
from bs4 import BeautifulSoup
import csv
import pandas as pd
import numpy as np

url = "https://en.wikipedia.org/wiki/Comma-separated_values"

r = requests.get(url)

soup = BeautifulSoup(r.content, "html.parser")

table = soup.select("#mw-content-text > div.mw-parser-output > table.wikitable > tbody > tr")

with open("table.csv", "w") as f:
    writer = csv.writer(f)
    for row in table:
        csv_row = []
        for cell in row.findAll(["td", "th"]):
            csv_row.append(cell.get_text())
        writer.writerow(csv_row)

print(csv_column)