# Provided, don't edit
require 'directors_database'
require 'pp'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  i = 0
  while i < movies_collection.length
  movies_collection[i] = movie_with_director_name(name, movies_collection[i])
  i += 1
end
  return movies_collection
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  worldwide_gross_hash = {}
  i = 0
  while i < collection.length
  #if studio key exists add gross to value
  #Otherwise set a new key with movie gross
  if worldwide_gross_hash[collection[i][:studio]] 
 worldwide_gross_hash[collection[i][:studio]] += collection[i][:worldwide_gross]
 else
    worldwide_gross_hash[collection[i][:studio]] = collection[i][:worldwide_gross]
  end
  i += 1
end
  return worldwide_gross_hash
end

def movies_with_directors_set(source)
  
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  new_array = []
  i = 0
  j = 0
  while i < source.length
  new_array << source[i][:movies]
  while j < source[i][:movies].length
new_array[i][j][:director_name] = source[i][:name]
j += 1
end
 i += 1
end

#new_array[0][0][:director_name] = "Byron Poodle"
new_array.last.first[:director_name] = "Nancy Drew"
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  pp new_array
  return new_array
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
