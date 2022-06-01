class AddDefaultStatusToOffers < ActiveRecord::Migration[6.1]
  def change
    change_column :offers, :status, :string, default: "active"
  end
end
