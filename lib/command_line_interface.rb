require 'pry'

def welcome
  # puts out a welcome message here!
  puts "Welcome!"
end

def get_character_from_user
  puts "please enter a character:"
  # use gets to capture the user's input. This method should return that input, downcased.
  character = gets.chomp
  character.downcase
end

def get_film_from_user
  puts "please enter a film title:"
  film = gets.chomp
  film.downcase
end
