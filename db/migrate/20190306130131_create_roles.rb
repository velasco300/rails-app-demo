class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :nick_name

      t.timestamps
    end
  end
end
