class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.string :location

      t.timestamps
    end
  end
end
