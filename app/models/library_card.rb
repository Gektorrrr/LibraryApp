class LibraryCard < ApplicationRecord
  belongs_to :library
  has_one :user

  def update_library_card
    card = LibraryCard.find(1)
    card.update(number: "Updated Card Number", library_id: 5)
  end
end
