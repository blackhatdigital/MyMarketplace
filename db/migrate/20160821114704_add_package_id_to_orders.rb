class AddPackageIdToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :package_id, :integer
  end
end
