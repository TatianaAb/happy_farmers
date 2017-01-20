require 'open-uri'
require 'json'
require 'pry'
require 'yaml'

market_data = []

# Fetch data from URL
BASE_URL = "https://data.cityofnewyork.us/resource/cw3p-q2v6.json"
response = open("#{BASE_URL}").read

# Parse JSON Data to Ruby Hash
PARSED_DATA = JSON.parse(response)  # gives you array of hashes

# List of options

# test case when search by borough == Manhattan
PARSED_DATA.select { |each_hash| each_hash["facilitycity"] == "Manhattan" }

# Get User Input


#


[ {   },
]



