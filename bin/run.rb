#!/usr/bin/env ruby

require 'pry'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
show_character_movies(character)

film = get_film_from_user
get_movie_info_from_api(film)
