class AddNameAndAvatarInUsers < ActiveRecord::Migration
  def change
    add_column     :users, :name, :string
    add_attachment :users, :avatar
  end
end
