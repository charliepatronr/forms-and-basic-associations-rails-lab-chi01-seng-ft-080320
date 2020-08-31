class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
     self.artist ? self.artist.name : nil
  end

  def song_content=(notes)
    notes.each do |note|
      if note !=""
        n = Note.create(content: note)
        self.notes << n
      end
    end
  end

  def song_content 
    self.notes.map do |note|
      note.content
    end
  
  end



end
