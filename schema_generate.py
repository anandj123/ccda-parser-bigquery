import json

f = open('schema.json')
data = json.load(f)
for i in data:
    print(i)
    exit(0)