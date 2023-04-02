class Genre < ApplicationRecord
  has_many :books

  def update_genre
    genre = Genre.find(1)
    genre.update(name: "Updated Genre Name")
  end

  def update_genre_id
    Genre.find(1).update(name: "New Genre Name")
  end
end
