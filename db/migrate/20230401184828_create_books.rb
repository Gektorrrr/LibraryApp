class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :library_id

      t.timestamps
    end
  end

  def view_books
    execute <<-SQL
    CREATE VIEW book_libraries AS
    SELECT books.title, libraries.name AS library_name
    FROM books
    LEFT JOIN libraries ON books.library_id = libraries.id;
    SQL
  end

  def view_books_authors
    execute <<-SQL
    CREATE VIEW book_authors AS
    SELECT books.title, GROUP_CONCAT(authors.name SEPARATOR ', ') AS author_names
    FROM books
    LEFT JOIN authors_books ON books.id = authors_books.book_id
    LEFT JOIN authors ON authors_books.author_id = authors.id
    GROUP BY books.id;
    SQL
  end
end
