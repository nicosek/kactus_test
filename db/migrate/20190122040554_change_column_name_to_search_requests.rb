class ChangeColumnNameToSearchRequests < ActiveRecord::Migration[5.2]
  def change
    rename_column :search_requests, :type, :type_of_property
  end
end
