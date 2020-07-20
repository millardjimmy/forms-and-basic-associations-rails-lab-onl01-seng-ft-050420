class Song < ActiveRecord::Base
  # add associations here
  has_many :notes
  belongs_to :artist
  belongs_to :genre
  validates :title, presence: true

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes=(songs)
    songs.each do |note|
      self.notes << Note.create(content: note)
    end
  end
end