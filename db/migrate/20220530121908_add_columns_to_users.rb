class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_reference :users, :business, foreign_key: true

    add_column :users, :admin, :boolean, default: false
  end
end
