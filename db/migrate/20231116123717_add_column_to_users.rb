class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_name, :string
    add_column :users, :user_introduction, :string
    add_column :users, :user_image, :string
  end
end
