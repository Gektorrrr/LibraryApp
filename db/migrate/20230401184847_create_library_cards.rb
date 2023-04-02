class CreateLibraryCards < ActiveRecord::Migration[7.0]
  def change
    create_table :library_cards do |t|
      t.string :number
      t.integer :library_id

      t.timestamps
    end
  end

  def view_library_cards
    execute <<-SQL
    CREATE VIEW user_cards_libraries AS
    SELECT users.name, library_cards.number, libraries.name AS library_name
    FROM users
    LEFT JOIN library_cards ON users.library_card_id = library_cards.id
    LEFT JOIN libraries ON library_cards.library_id = libraries.id;
    SQL
  end
end
