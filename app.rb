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

puts sign

puts "Welcome to Happy Farmers B(-_-)B"


puts "What can I help you with?"
puts "A. Find Markets in your borough"
puts "B. Find Market by zip code"
puts "C. Search Market by name"

puts
puts"Please enter a letter"
puts
response = gets.chomp.upcase

# case response
# when 'A'
#   puts "Please enter your zip code"
#   zipcode = gets.chomp
# when 'B'
#   puts "Please enter a borough name"
#   borough = gets.chomp.capitalize
# when 'C'
#   puts "Please enter market name"
#   market_name = gets.chomp.capitalize
# end


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

#while true
  case response
  when "A"
    puts "Please enter a borough name"
    borough = gets.chomp.downcase
    parameter_array = PARSED_DATA.select {|param| param["facilitycity"].downcase == borough}
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
  when "exit"
    # break
  else
    puts "Unrecognized request"
  end
  p parameter_array


  # reset_screen
#end

