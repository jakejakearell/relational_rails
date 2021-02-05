# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.destroy_all
Player.destroy_all
Game.destroy_all
VideoStore.destroy_all

game_1 = Game.create!(televised: true, stadium_name: "MetLife", attendance: 30000)
game_2 = Game.create!(televised: false, stadium_name: "Coors", attendance: 25000)

player_1 = game_1.players.create!(position: "QB", weight: 210, injured: true)
player_2 = game_1.players.create!(position: "RB", weight: 180, injured: false)
player_3 = game_1.players.create!(position: "LB", weight: 220, injured: false)
player_4 = game_1.players.create!(position: "OLT", weight: 310, injured: true)
player_5 = game_1.players.create!(position: "DB", weight: 195, injured: false)

player_6 = game_2.players.create!(position: "WR", weight: 170, injured: false)
player_7 = game_2.players.create!(position: "QB", weight: 240, injured: false)
player_8 = game_2.players.create!(position: "RT", weight: 350, injured: false)
player_9 = game_2.players.create!(position: "DB", weight: 220, injured: false)
player_10 = game_2.players.create!(position: "DB", weight: 195, injured: true)


video_store_1 = VideoStore.create!(name: "Video Plus", rank: 1, flagship_store: false)
video_store_2 = VideoStore.create!(name: "Video Prime", rank: 2, flagship_store: true)

movie_1 = video_store_1.movies.create!(name:"Rent", available: true, year_filmed: 2001)
movie_2 = video_store_1.movies.create!(name:"Rambo", available: false, year_filmed: 1989)
movie_3 = video_store_2.movies.create!(name:"Alien", available: false, year_filmed: 1988)
movie_4 = video_store_2.movies.create!(name:"Predator", available: true, year_filmed: 1990)
