class AddNicknameToBusinesses < ActiveRecord::Migration[6.1]
  def change
    add_column :businesses, :nickname, :string
  end
end
