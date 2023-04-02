class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name

      t.timestamps
    end
  end

  def view_library_cards
    execute <<-SQL
    CREATE VIEW author_books AS
    SELECT authors.name, books.title
    FROM authors
    LEFT JOIN authors_books ON authors.id = authors_books.author_id
    LEFT JOIN books ON authors_books.book_id = books.id;
    SQL
  end
end
