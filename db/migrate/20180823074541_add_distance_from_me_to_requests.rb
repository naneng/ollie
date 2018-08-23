class AddDistanceFromMeToRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :distance_from_me, :integer
  end
end
