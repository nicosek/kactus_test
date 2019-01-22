class CreateSearchRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :search_requests do |t|
      t.string :city
      t.string :type_transac
      t.integer :pricemin
      t.integer :pricemax
      t.integer :surfacemin
      t.integer :surfacemax
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
