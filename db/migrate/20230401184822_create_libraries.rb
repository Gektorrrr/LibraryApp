class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end

  def view_library_books
    execute <<-SQL
    CREATE VIEW library_book_counts AS
    SELECT libraries.name, COUNT(books.id) AS book_count
    FROM libraries
    LEFT JOIN books ON libraries.id = books.library_id
    GROUP BY libraries.id;
    SQL
  end
end
