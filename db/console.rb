require 'pry-byebug'
require_relative '../models/album'
require_relative '../models/artist'

artist1 = Artist.new({
  'name' => 'Jimi Hendrix'
  })

artist1.save()

binding.pry
nil
