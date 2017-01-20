require 'open-uri'
require 'json'
require 'pry'
require 'yaml'
require 'faker'
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
 sign1 =
 "
.----------------.  .----------------.  .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  ____  ____  | || |      __      | || |   ______     | || |   ______     | || |  ____  ____  | |
| | |_   ||   _| | || |     /  '     | || |  |_   __ |   | || |  |_   __ |   | || | |_  _||_  _| | |
| |   | |__| |   | || |    / /\ '    | || |    | |__) |  | || |    | |__) |  | || |   | '|  / /   | |
| |   |  __  |   | || |   / ____ '   | || |    |  ___/   | || |    |  ___/   | || |    | |/ /    | |
| |  _| |  | |_  | || | _/ /    | '_ | || |   _| |_      | || |   _| |_      | || |    _|  |_    | |
| | |____||____| | || ||____|  |____|| || |  |_____|     | || |  |_____|     | || |   |______|   | |
| |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.  .----------------.
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  _________   | || |      __      | || |  _______     | || | ____    ____ | || |  _________   | || |  _______     | || |    _______   | |
| | |_   ___  |  | || |     /  |     | || | |_   __ '    | || ||_   |  /   _|| || | |_   ___  |  | || | |_   __ |    | || |   /  ___  |  | |
| |   | |_  |_|  | || |    / /| |    | || |   | |__) |   | || |  |   '/   |  | || |   | |_  |_|  | || |   | |__) |   | || |  |  (__ |_|  | |
| |   |  _|      | || |   / ____ |   | || |   |  __ /    | || |  | ||  /| |  | || |   |  _|  _   | || |   |  __ /    | || |   '.___`-.   | |
| |  _| |_       | || | _/ /    | |_ | || |  _| |  | |_  | || | _| |_'/_| |_ | || |  _| |___/ |  | || |  _| |  | '_  | || |  |`|____) |  | |
| | |_____|      | || ||____|  |____|| || | |____| |___| | || ||_____||_____|| || | |_________|  | || | |____| |___| | || |  |_______.'  | |
| |              | || |              | || |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'  '----------------'
 "
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
  puts

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
    reset_screen
    puts
    puts "Now... why would you do that?.."
    puts
    sleep(1)
    puts "Please enter an option we recognize!"
    puts
    loading_error
  end

  if !parameter_array.nil?
    reset_screen
    puts sign
    print_result(parameter_array)
    puts
    puts
    puts "Would you like to continue or exit?"
    if gets.chomp.downcase == "exit"
      break
    end
  end

end



