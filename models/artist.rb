require('pg')
require_relative('../db/sql_runner')
require_relative('album')


class Artist
  attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i() if options['id']
    @name = options['name']
  end

  def save()
      sql = "INSERT INTO artists
      (
        name
      ) VALUES
      (
        $1
      )
      RETURNING id"
      values = [@name]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i
    end

    def albums_by_artist()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    albums = results.map { |album_hash| Album.new(album_hash) }
    return albums
  end


  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    artist_hash = results.first # OR results[0]
    artist = Artist.new(artist_hash)
    return artist
  end


    def self.all()
      sql = "SELECT * FROM artists"
      artists = SqlRunner.run(sql)
      return artists.map { |artist| Artist.new(artist) }
    end

    def self.delete_all()
        sql = "DELETE FROM artists"
     SqlRunner.run(sql)
    end
end
