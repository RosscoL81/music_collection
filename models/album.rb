require('pg')
require_relative('../db/sql_runner')
require_relative('artist')

class Album

  attr_reader :id, :artist_id, :title, :genre

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
    @title = options['title']
    @genre = options['genre']

  end

end
