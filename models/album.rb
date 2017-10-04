require_relative '../db/sql_runner'
require_relative 'artist'

class Album

attr_reader :id
attr_accessor :artist_id, :title, :genre

  def initialize(options)
    @artist_id = options['artist_id'].to_i
    @title = options['title']
    @genre = options['genre']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO albums (artist_id, title, genre) VALUES ($1, $2, $3)
    RETURNING id;"
    values = [@artist_id, @title, @genre]
    result = SqlRunner.run(sql, "save_album", values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE albums SET (artist_id, title, genre) = ($1, $2, $3)
    WHERE id = $4;"
    values = [@artist_id, @title, @genre, @id]
    SqlRunner.run(sql, "update_album", values)
  end

  def self.delete_all()
    sql = "DELETE FROM albums;"
    values = []
    SqlRunner.run(sql, "delete_all_albums", values)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, "delete_album", values)
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, "find_album", values)
    album = result.map {|album| Album.new(album)}
    return album
  end

  def self.all()
    sql = "SELECT * FROM albums;"
    values = []
    results = SqlRunner.run(sql, "show_all_albums", values)
    albums = results.map {|album| Album.new(album)}
    return albums
  end

end
