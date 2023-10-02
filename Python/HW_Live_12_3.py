## HW03 - Find Public API and use python to get data

import requests
import time

starships = [ ]

for i in range(10) :
    url = f"https://swapi.dev/api/starships/{i+1}"
    resp = requests.get(url)

    if resp.status_code == 200:
        json_data = resp.json()
        starships.append(
            (json_data["name"],
            json_data["model"])
        )

    # break a second
    time.sleep(1)


print(starships)
