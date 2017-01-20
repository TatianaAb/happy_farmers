def print_result(array_of_hashes)

  print_title
  puts
  puts "Sorry, there are no market's around your area. I would seriously consider moving... Just saying =]" if array_of_hashes.empty?
  print_data(array_of_hashes)

end

def print_title
  divider = 205
  space = 40

  result = ""
  titles = ["Market Name", "Address", "City", "State", "Zip Code"]

  titles.each do |title|
      result += "|"
      result += "#{title}".center(space)
  end
  result += "|"

  puts "*" * divider
  puts result
  puts "*" * divider
end

def print_data(array_of_hashes)
  beg_in = 0
  end_in = 20
  space = 40
  divider = 205

  keys = ["facilityname", "facilitystreetname", "facilitycity", "facilitystate", "facilityzipcode"]

  array_of_hashes.each do |each_hash|
    temp = ""
    temp += "|"
    keys.each do |key|
      temp += each_hash[key][beg_in, end_in].center(space)
    temp += "|"
    end
    puts temp
  end

  puts
  puts "*" * divider
end
