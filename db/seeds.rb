# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
books = Book.create([
  {
    name: "Design Patterns",
    author: "Christopher Lasater",
    status: "Ready to Start",
    link: "https://catalog.princeton.edu/catalog/99125141254206421"
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
  },
  {
    name: "Practical object-oriented design",
    author: "Sandi Metz",
    status: "Ready to Start",
    link: "https://catalog.princeton.edu/catalog/99109036093506421"
  },
  {
    name: "The Go programming language",
    author: "Alan Donovan, Brian Kernighan",
    status: "Ready to Start",
    link: "https://catalog.princeton.edu/catalog/9996338243506421"
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
    name: "Brooklyn Nine-Nine",
    status: "In Progress",
    notes: "Thursdays at 8pm ET. Also premieres on Hulu."
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
    rating: "4",
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
