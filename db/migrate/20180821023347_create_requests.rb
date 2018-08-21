class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.string :pickup_location
      t.string :dropoff_location
      t.date :datetime
      t.string :notes
      t.integer :status
      t.integer :distance
      t.integer :time

      t.timestamps
    end
  end
end
