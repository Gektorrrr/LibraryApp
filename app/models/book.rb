class Book < ApplicationRecord
  belongs_to :library
  has_and_belongs_to_many :authors
  belongs_to :genre

  def available_books
    Book.find_by_sql("SELECT * FROM books WHERE library_id=#{self.id}")
  end

  def list_books
    Book.order(:title)
  end

  def list_sciene_fiction
    Genre.find_by(name: "Science Fiction").books
  end

  def update_book
    book = Book.find(1)
    book.update(title: "Updated Book Title", description: "Updated Description", library_id: 5)
  end

  def update_book_id
    Book.find(1).update(title: "New Book Title")
  end

  def update_book_sql
    ActiveRecord::Base.connection.execute("UPDATE libraries SET book_count = 50 WHERE id = 1;")
  end

  def list_books_sql
    Book.find_by_sql("SELECT * FROM books ORDER BY title;")
  end

  def list_books_library_sql
    Book.find_by_sql("SELECT * FROM books WHERE library_id = 1;")
  end

  def list_books_authors_sql
    Book.find_by_sql("SELECT books.* FROM books
                  JOIN authors_books ON books.id = authors_books.book_id
                  WHERE authors_books.author_id = 1;")
  end

  def list_books_sciene_fiction_sql
    Book.find_by_sql("SELECT books.* FROM books
                  JOIN books_genres ON books.id = books_genres.book_id
                  JOIN genres ON books_genres.genre_id = genres.id
                  WHERE genres.name = 'Science Fiction';")
  end
end
