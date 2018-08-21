class AddOrganizationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :organization, :boolean
  end
end
