class Library < ApplicationRecord
  has_many :books
  has_many :library_cards

  def list_library
    Library.find(1).books
  end

  def update_library
  library = Library.find(1)
  library.update(name: "Updated Library Name", address: "Updated Address")
  end

  def update_library_sql
    ActiveRecord::Base.connection.execute("UPDATE libraries SET name = 'New Library Name' WHERE id = 1;")
  end

  def list_library_sql
    Library.find_by_sql("SELECT * FROM libraries WHERE book_count > 100;")
  end
end
