require 'faker'

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

def loading
  puts
  print "loading"
  6.times do |t|
    print '.'
    sleep(0.5)
  end
  puts
  puts
  puts "I know you appreciated that moment of serenity"
  sleep(2)

  3.times do |t|
    puts
    puts "HA"
    sleep (1)
  end
end

def loading_error
  puts
  print "loading"
  6.times do |t|
    print '.'
    sleep(0.5)
  end
  puts
  puts
  puts
  puts "While we wait for it to reload.."
  puts
  puts "Here's a Chuck Norris fact.."
  puts
  puts "Did you know.."
  puts
  puts Faker::ChuckNorris.fact

  sleep(2)

  5.times do |t|
    puts
    puts "HA"
    sleep (1)
  end
end
