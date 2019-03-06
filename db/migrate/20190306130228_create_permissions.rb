class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :resource
      t.string :action
      t.string :nick_name

      t.timestamps
    end
  end
end
