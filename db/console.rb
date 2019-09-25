require("pry")
require_relative("../models/album")
require_relative("../models/artist")



artist1 = Artist.new({
'name' => 'Michael Jackson'
  })

  artist1.save()

  album1 = Album.new({
 'title' => 'Thriller',
 'genre' => 'Pop',
 'artist_id' => artist1.id
 })

 album1.save()

 album2 = Album.new({
'title' => 'Bad',
'genre' => 'Pop',
'artist_id' => artist1.id
})

album2.save()


#----------------------------------------------------
artist2 = Artist.new({
'name' => 'The  Beatles'
    })
  artist2.save()

  album3 = Album.new({
 'title' => 'Abbey Road',
 'genre' => 'Rock',
 'artist_id' => artist2.id
 })

album3.save()

album4 = Album.new({
'title' => 'The White Album',
'genre' => 'Rock',
'artist_id' => artist2.id
})

album4.save()
