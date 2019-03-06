class CreateRolePermissionRsps < ActiveRecord::Migration[5.2]
  def change
    create_table :role_permission_rsps do |t|
      t.integer :role_id
      t.integer :permission_id

      t.timestamps
    end
  end
end
