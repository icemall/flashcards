class SorceryCore < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :password
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
    add_index :users, :email, unique: true
  end

  def down
    add_column :users, :password, :string
    remove_column :users, :crypted_password
    remove_column :users, :salt
    remove_index :users, :email
  end
end
