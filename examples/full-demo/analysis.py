#!/usr/bin/python
import csv23
import random
import os

# Code based on https://gist.github.com/AlanHohn/293c98f9dadfc67443b8078d843d4401
size = int(os.environ['DATA_SIZE'])
print("Data size: %d\n" % size)

fieldnames = ['id', 'name', 'age', 'city']
writer = csv23.DictWriter(open("data.csv", "w"), fieldnames = fieldnames)
names = ['Daniel', 'Vanessa', 'Ben', 'Stephen', 'Tim', 'Tony', 'Ben']
cities=['Muenster', 'Stanford', 'Seattle', 'Cambridge', 'Zurich', 'Bristol']

writer.writerow(dict(zip(fieldnames, fieldnames)))
for i in range(0, size):
  writer.writerow(dict([
    ('id', i),
    ('name', random.choice(names)),
    ('age', str(random.randint(18,81))),
    ('city', random.choice(cities))]))
