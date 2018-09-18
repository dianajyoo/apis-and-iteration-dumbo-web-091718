require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)

  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  film_arr = []

  response_hash['results'].each do |attributes|
    if attributes['name'].downcase == character.downcase
      attributes['films'].each do |title_url|
        films_string = RestClient.get(title_url)
        films_json = JSON.parse(films_string)
        film_arr << films_json
      end
    end
  end
  film_arr
end

def parse_character_movies(character)
  puts get_character_movies_from_api(character)[0]["title"]
end

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
  films_hash.each_with_index do |attribute, index|
    puts "#{index + 1}. #{attribute["title"]}"
  end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# Once you have your program working as expected, challenge
# yourself. Can you add more methods so that a user can make
# additional queries to the API? Maybe a user should be able to
# input a movie name and get some movie info in return?


def get_movie_info_from_api(film)

  film_info = []
  films = RestClient.get('https://swapi.co/api/films/')
  parsed_films = JSON.parse(films)

  parsed_films['results'].each do |film_choice|
    if film_choice["title"].downcase == film.downcase
      puts "Title: #{film_choice["title"]} "
      puts "Producer: #{film_choice["producer"]} "
      puts "Release Date: #{film_choice["release_date"]}"
    end
  end
end
