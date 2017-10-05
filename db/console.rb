require 'pry-byebug'
require_relative '../models/album'
require_relative '../models/artist'

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Jimi Hendrix'
  })
  artist2 = Artist.new({
    'name' => 'Mumford & Sons'
    })
artist1.save()
artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id(),
  'title' => 'Electric Ladyland',
  'genre' => 'Psychedelic Rock'
  })
  album2 = Album.new({
    'artist_id' => artist2.id(),
    'title' => 'Sigh No More',
    'genre' => 'Folk Rock'
    })
    album3 = Album.new({
      'artist_id' => artist2.id(),
      'title' => 'Babel',
      'genre' => 'Indie Folk'
      })
album1.save()
album2.save()
album3.save()

binding.pry
nil
