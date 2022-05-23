import json
baseURI = "https://gateway.pinata.cloud/ipfs/QmTR1LwPScSaknte6VuJbvmq8fLw584Z5kMwPJ54w9aFc2/"

for i in range(7):
    data = {
        "name": f"MCUOSC #{i}",
        "description": f"mcuosc #{i}",
        "image": f"{baseURI}{i}.png"
        }
    f = open(f'./META_JSON/{i}.json', 'w')
    f.write(json.dumps(data))
