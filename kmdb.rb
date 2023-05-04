# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.

Movie.destroy_all
Role.destroy_all
Actor.destroy_all
Studio.destroy_all

Rails.logger.info "------------------------"
Rails.logger.info "----- FRESH START! -----"
Rails.logger.info "------------------------"

# Generate models and tables, according to the domain model.
# TODO!
##Done in Terminal**********************************

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

#Enter the studio data
studio = Studio.new
studio["name"] = "Warner Bros."
studio.save

studio_warner = Studio.find_by({ "name" => "Warner Bros."})

#Enter the movie data
movie = Movie.new
movie["title"] = "Batman Begins"
movie["year_released"] = 2005
movie["rated"] = "PG-13"
movie["studio_id"] = studio_warner["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year_released"] = 2008
movie["rated"] = "PG-13"
movie["studio_id"] = studio_warner["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = 2012
movie["rated"] = "PG-13"
movie["studio_id"] = studio_warner["id"]
movie.save

#create the variables for the movies so that the id's can be used
batman_begins = Movie.find_by({ "title" => "Batman Begins"})
dark_knight = Movie.find_by({ "title" => "The Dark Knight"})
dark_knight_rises = Movie.find_by({ "title" => "The Dark Knight Rises"})

#Enter the actor data
actor = Actor.new
actor["name"] = "Christian Bale"
actor.save

cb = Actor.find_by({ "name" => "Christian Bale"})

actor = Actor.new
actor["name"] = "Michael Cane"
actor.save

mc = Actor.find_by({ "name" => "Michael Cane"})

actor = Actor.new
actor["name"] = "Liam Neeson"
actor.save

ln = Actor.find_by({ "name" => "Liam Neeson"})

actor = Actor.new
actor["name"] = "Katie Holmes"
actor.save

kh = Actor.find_by({ "name" => "Katie Holmes"})

actor = Actor.new
actor["name"] = "Gary Oldman"
actor.save

go = Actor.find_by({ "name" => "Gary Oldman"})

actor = Actor.new
actor["name"] = "Heath Ledger"
actor.save

hl = Actor.find_by({ "name" => "Heath Ledger"})

actor = Actor.new
actor["name"] = "Aaron Eckhart"
actor.save

ae = Actor.find_by({ "name" => "Aaron Eckhart"})

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor.save

mg = Actor.find_by({ "name" => "Maggie Gyllenhaal"})

actor = Actor.new
actor["name"] = "Tom Hardy"
actor.save

th = Actor.find_by({ "name" => "Tom Hardy"})

actor = Actor.new
actor["name"] = "Joseph Gordon-Levitt"
actor.save

jgl = Actor.find_by({ "name" => "Joseph Gordon-Levitt"})

actor = Actor.new
actor["name"] = "Anne Hathaway"
actor.save

ah = Actor.find_by({ "name" => "Anne Hathaway"})

#Enter the Character Data
role = Role.new
role["character_name"] = "Bruce Wayne"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = cb["id"]
role.save

role = Role.new
role["character_name"] = "Bruce Wayne"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = cb["id"]
role.save

role = Role.new
role["character_name"] = "Bruce Wayne"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = cb["id"]
role.save

role = Role.new
role["character_name"] = "Alfred"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = mc["id"]
role.save

role = Role.new
role["character_name"] = "Alfred"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = mc["id"]
role.save

role = Role.new
role["character_name"] = "Ra's Al Ghul"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = ln["id"]
role.save

role = Role.new
role["character_name"] = "Ra's Al Ghul"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = ln["id"]
role.save

role = Role.new
role["character_name"] = "Rachel Dawes"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = kh["id"]
role.save

role = Role.new
role["character_name"] = "Rachel Dawes"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = mg["id"]
role.save

role = Role.new
role["character_name"] = "Commissioner Gordon"
role["movie_id"] = batman_begins["id"]
role["actor_id"] = go["id"]
role.save

role = Role.new
role["character_name"] = "Commissioner Gordon"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = go["id"]
role.save

role = Role.new
role["character_name"] = "Joker"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = hl["id"]
role.save

role = Role.new
role["character_name"] = "Harvey Dent"
role["movie_id"] = dark_knight["id"]
role["actor_id"] = ae["id"]
role.save

role = Role.new
role["character_name"] = "Bane"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = th["id"]
role.save

role = Role.new
role["character_name"] = "John Blake"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = jgl["id"]
role.save

role = Role.new
role["character_name"] = "Selina Kyle"
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = ah["id"]
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""


# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
