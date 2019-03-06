class CreateUserRoleRsps < ActiveRecord::Migration[5.2]
  def change
    create_table :user_role_rsps do |t|
      t.integer :user_id
      t.integer :role_id

      t.timestamps
    end
  end
end
