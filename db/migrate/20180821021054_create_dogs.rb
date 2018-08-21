class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :size
      t.string :personality
      t.integer :age
      t.string :gender
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
