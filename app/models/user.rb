class User < ApplicationRecord
  belongs_to :library_card

  def users_using_library_cards
    User.find_by_sql("SELECT * FROM users WHERE library_card_id IN (SELECT id FROM library_cards WHERE library_id=#{self.id})")
  end

  def list_users
    User.order(name: :desc)
  end

  def update_user
    user = User.find(1)
    user.update(name: "Updated User Name", library_card_id: 5)
  end

  def update_user_id
    User.find(1).update(name: "New User Name")
  end

  def list_users_sql
    User.find_by_sql("SELECT * FROM users ORDER BY name DESC;")
  end
end
