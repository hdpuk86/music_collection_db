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

end
