require_relative 'planet'
require_relative 'solar_system'

def setup_solar_system
  new_solar_system = SolarSystem.new('Sol')

  earth = Planet.new('Earth', 'blue-green', 5.972e24, 1.496e8, 'Only planet known to support life')

  pluto = Planet.new('Pluto', 'blue', 1.309e22, 5.906e38, 'No longer a planet ;(')

  saturn = Planet.new('Saturn', 'yellow-ish brown', 5.683e26, 1.434, 'Saturn has 7 rings!')

  new_solar_system.add_planet(earth)
  new_solar_system.add_planet(pluto)
  new_solar_system.add_planet(saturn)

  return new_solar_system
end

def get_user_action_choice
  puts "What would you like to do?"
  choices = ["list planets", "planet details", "add planet", "exit"]
  choices.each do |choice|
    puts "💫 #{choice}"
  end

  return gets.chomp
end

def get_user_planet_choice
  puts "What is the name of the planet you wish to learn about?"
  return gets.chomp
end

def get_new_user_planet
  puts "Let's add a new planet! Please provide the following info:"
  puts "Planet name:"
  name = gets.chomp
  puts "Planet color:"
  color = gets.chomp
  puts "Planet's mass in kilograms:"
  mass = gets.chomp
  puts "Planet's distance from in the sun in kilometers:"
  distance = gets.chomp
  puts "Fun fact about planet:"
  fun_fact = gets.chomp

  new_planet = Planet.new(name, color, mass, distance, fun_fact)
  
  return new_planet
end

def main
  my_solar_system = setup_solar_system

  should_program_run = true

  while (should_program_run)

    user_choice = get_user_action_choice

    case user_choice.upcase
    when "LIST PLANETS"
      puts my_solar_system.list_planets

    when "PLANET DETAILS"
      planet_name = get_user_planet_choice
      found_planet = my_solar_system.find_planet_by_name(planet_name)
      if (found_planet)
        puts found_planet.summary
      else
        puts "I couldn't find a planet by the name #{user_planet_details_choice}."
      end

    when "ADD PLANET"
      new_planet = get_new_user_planet
      my_solar_system.add_planet(new_planet)

    when "EXIT"
      should_program_run = false
    else
      puts "I didn't understand that as a valid choice. Let's try again."
    end
  end
end

main