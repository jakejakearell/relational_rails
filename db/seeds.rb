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

video_store_1 = VideoStore.create!(name: "Video Plus", rank: 1, flagship_store: false)
video_store_2 = VideoStore.create!(name: "Video Prime", rank: 2, flagship_store: true)

movie_1 = video_store_1.movies.create!(name:"Rent", available: true, year_filmed: 2001)
