require 'open-uri'
require 'json'
require 'pry'
require 'yaml'
require_relative 'display'
require_relative 'reset'



market_data = []

# Fetch data from URL
BASE_URL = "https://data.cityofnewyork.us/resource/cw3p-q2v6.json"
response = open("#{BASE_URL}").read

# Parse JSON Data to Ruby Hash
PARSED_DATA = JSON.parse(response)  # gives you array of hashes

# List of options

# test case when search by borough == Manhattan
PARSED_DATA.select { |each_hash| each_hash["facilitycity"] == "Manhattan" }

# Welcome
sign =
" .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  ____  ____  | || |      __      | || |   ______     | || |   ______     | || |  ____  ____  | |
| | |_   ||   _| | || |     /  '     | || |  |_   __ '   | || |  |_   __ '   | || | |_  _||_  _| | |
| |   | |__| |   | || |    / /' '    | || |    | |__) |  | || |    | |__) |  | || |   \ \  / /   | |
| |   |  __  |   | || |   / ____ '   | || |    |  ___/   | || |    |  ___/   | || |    \ \/ /    | |
| |  _| |  | |_  | || | _/ /    ' '_ | || |   _| |_      | || |   _| |_      | || |    _|  |_    | |
| | |____||____| | || ||____|  |____|| || |  |_____|     | || |  |_____|     | || |   |______|   | |
| |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------' "

reset_screen
puts sign

puts "Welcome to Happy Farmers B(-_-)B"
puts
puts "Your ultimate resource to locate awesome farmer markets!!!"
loading

loop do
  reset_screen
  puts sign
  puts
  puts "What can I help you with? Please enter a letter or 'exit' to quit"
  puts
  puts "A. Find Markets in your borough"
  puts "B. Find Markets by zip code"
  puts "C. Search Market by name"
  puts "or exit"

  # Get User Input
  puts
  puts"Please enter a letter"
  puts
  response = gets.chomp.upcase

  #while true

  parameter_array = nil

  case response
  when "A"
    puts "Please enter a borough name"
    borough = gets.chomp.capitalize
    parameter_array = PARSED_DATA.select {|param| param["facilitycity"] == borough}
  when "B"
    puts "Please enter your zip code"
    zipcode = gets.chomp
    parameter_array = PARSED_DATA.select {|param| param["facilityzipcode"] == zipcode}
  when "C"
    puts "Please enter market name"
    market_name = gets.chomp.downcase
    parameter_array = PARSED_DATA.select do |param|
      param["facilityname"].downcase.include?(market_name)
    end
  when "EXIT"
    break
  else
    puts
    puts "Now... why would you do that?.."
    puts
    sleep(1)
    puts "Please enter an option we recognize!"
    puts
    sleep(5)
  end

  if !parameter_array.nil?
    reset_screen
    puts sign
    print_result(parameter_array)
  end

  puts
  puts
  puts "Would you like to continue or exit?"
  if gets.chomp.downcase == "exit"
    break
  end
end



