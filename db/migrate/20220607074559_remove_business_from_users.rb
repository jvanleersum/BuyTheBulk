class RemoveBusinessFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_reference :users, :business, null: false, foreign_key: true
  end
end
