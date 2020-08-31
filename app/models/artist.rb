class Artist < ActiveRecord::Base
  has_many :songs

  def artist_name=(name)
    self.artist = Category.find_or_create_by(name: name)
  end

  def category_name
     self.category ? self.category.name : nil
  end
end
