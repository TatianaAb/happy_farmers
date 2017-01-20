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



# The following methods will help us
# to update the screen when printing the board.
# We don't need to test these methods.
def reset_screen
  clear_screen
  move_to_home
end

# Clears the content on the screen. Ah, a fresh canvas.
def clear_screen
  print "\e[2J"
end

# Moves the insert point in the terminal back to the upper left.
def move_to_home
  print "\e[H"
end


value = 'tbd'
while true
  case value
  when "A"
    parameter_array = farmer_array.select {|param| param["facilityborough"] == param}
  when "B"
    parameter_array = farmer_array.select {|param| param["facilityzipcode"] == param}
  when "C"
    paramter_array = farmer_array.select {|param| param["facilityname"] == param}
  when "exit"
    break
  else
    put "Unrecognized request"
  end
end


