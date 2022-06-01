class AddDetailsToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :room_id, :integer
    add_column :reservations, :user_id, :integer
    add_column :reservations, :total_amount, :integer
  end
end
