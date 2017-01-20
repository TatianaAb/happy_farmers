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
puts "Welcome to Happy Farmers B(-_-)B"


puts "What can I help you with?"
puts "A. Find Market by zip code"
puts "B. Find Markets in your borough"
puts "C. Search Market by name"

response = gets.chomp.upcase

case response
when 'A'
  puts "Please enter your zip code"
  zipcode = gets.chomp
when 'B'
  puts "Please enter a borough name"
  borough = gets.chomp
when 'C'
  puts "Please enter market name"
  market_name = gets.chomp
end

#

