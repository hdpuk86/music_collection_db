require_relative '../db/sql_runner'

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = SqlRunner.run(sql, "save_artist", values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM artists;"
    values = []
    SqlRunner.run(sql, "delete_all_artists", values)
  end

  def update()
    sql = "UPDATE artists SET (name) = ($1) WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, "update_artist", values)
  end

  def delete()
    sql = "DELETE FROM artists WHERE ID = $1;"
    values = [@id]
    SqlRunner.run(sql, "delete_artist", values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, "find_artist", values)
    artist = result.map {|result| Artist.new(result)}
    return artist
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    values = []
    results = SqlRunner.run(sql, "show_all_artists", values)
    artists = results.map {|artist| Artist.new(artist)}
    return artists
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, "albums", values)
    albums = results.map {|album| Album.new(album)}
    return albums
  end

end
