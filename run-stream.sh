#!/bin/bash
cd fakestream && pipenv run python3 fake.py --topic friends --template resources/friends.json --mps 5 --ms 20000
