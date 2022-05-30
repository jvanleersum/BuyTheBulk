class AddDeadlineToOffer < ActiveRecord::Migration[6.1]
  def change
    add_column :offers, :deadline, :datetime
  end
end
