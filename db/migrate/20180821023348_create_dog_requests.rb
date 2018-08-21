class CreateDogRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_requests do |t|
      t.references :dog, foreign_key: true
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
