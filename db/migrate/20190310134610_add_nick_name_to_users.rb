class AddNickNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nick_name, :string
  end
end
