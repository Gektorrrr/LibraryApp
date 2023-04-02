class Author < ApplicationRecord
  has_and_belongs_to_many :books

  def list_authors
    Author.find(1).books
  end

  def update_author
  author = Author.find(1)
  author.update(name: "Updated Author Name")
  end

  def update_author_sql
    ActiveRecord::Base.connection.execute("UPDATE authors SET name = 'New Author Name' WHERE id = 1;")
  end
end
