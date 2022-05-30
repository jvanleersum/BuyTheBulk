class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nickname, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_reference :users, :business, null: false, foreign_key: true
  end
end
