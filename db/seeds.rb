# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
books = Book.create([
  {
    name: "Atomic Habits",
    author: "James Clear",
    status: "In Progress"
  },
  {
    name: "The Hunger Games",
    author: "Suzanne Collins",
    status: "Finished",
    rating: 5,
    notes: "New prequel book came out about President Snow."
  },
  {
    name: "The Pragmatic Programmer",
    author: "Andy Hunt and Dave Thomas",
    status: "Ready to Start"
  }
])

tv_shows = TvShow.create([
  {
    name: "Attack On Titan",
    status: "Paused",
    link: "https://www.crunchyroll.com/attack-on-titan",
    notes: "Returning in 2022"
  },
  {
    name: "Rick and Morty",
    status: "In Progress",
    link: "https://www.adultswim.com/videos/rick-and-morty",
    notes: "Sundays at 11pm ET."
  }
])

movies = Movie.create([
  {
    name: "Minari",
    status: "Ready to Start",
  },
  {
    name: "Cruella",
    status: "Ready to Start",
  }
])

music = Music.create([
  {
    name: "Happier Than Ever",
    artist: "Billie Eilish",
    status: "In Progress",
    link: "https://open.spotify.com/album/0JGOiO34nwfUdDrD612dOp?autoplay=true"
  },
  {
    name: "SOUR",
    artist: "Olivia Rodrigo",
    status: "Finished",
    link: "https://open.spotify.com/album/6s84u2TUpR3wdUv4NgKA2j?autoplay=true"
  },
])

thanya = User.new
thanya.first_name = "Thanya"
thanya.last_name = "Begum"
thanya.email = "thanya@gmail.com"
thanya.password = "library123"
thanya.items = [*books, *tv_shows, *movies, *music]
thanya.save!
