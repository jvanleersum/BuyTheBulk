class AddReferenceToBusinesses < ActiveRecord::Migration[6.1]
  def change
    add_reference :businesses, :user, foreign_key: true
  end
end
