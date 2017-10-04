require 'pry-byebug'
require_relative '../models/album'
require_relative '../models/artist'

Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Jimi Hendrix'
  })

artist1.save()

# artist1.name = 'Papa Roach'
# artist1.update()

binding.pry
nil
