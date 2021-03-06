#!/bin/python
# -*- coding: utf-8 -*-

import requests

CITY = "Insert your city code (found in URL)"
API_KEY = "Insert OpenWeatherMap API key"
UNITS = "Insert your units (Default: Kelvin, Options: Metric, Imperial)"
UNIT_KEY = "Insert your Unit Key(K, C, F)"

REQ = requests.get("http://api.openweathermap.org/data/2.5/weather?id={}&appid={}&units={}".format(CITY, API_KEY, UNITS))
try:
    # HTTP CODE = OK
    if REQ.status_code == 200:
        CURRENT = REQ.json()["weather"][0]["description"].capitalize()
        TEMP = int(float(REQ.json()["main"]["temp"]))
        print("{}, {} °{}".format(CURRENT, TEMP, UNIT_KEY))
    else:
        print("Error: BAD HTTP STATUS CODE " + str(REQ.status_code))
except (ValueError, IOError):
    print("Error: Unable print the data")
