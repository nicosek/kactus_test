class AddNameToSearchRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :search_requests, :name, :string
  end
end
