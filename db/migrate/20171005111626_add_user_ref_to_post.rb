class AddUserRefToPost < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :author, references: :users
  end
end
