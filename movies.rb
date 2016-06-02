movie_lengths = [60,51,70]
flight_length = 120 

require 'set'

def in_flight_movie(movie_lengths, flight_length)
  movie_lengths_seen = Set.new

  movie_lengths.each do |first_movie|
    matching_second_movie = flight_length - first_movie
    if movie_lengths_seen.include? matching_second_movie
      return true 
    else 
      movie_lengths_seen.add(first_movie)
    end 
  end 
  return false 
end 

puts in_flight_movie(movie_lengths, flight_length)


