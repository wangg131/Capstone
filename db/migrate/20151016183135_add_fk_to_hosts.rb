class AddFkToHosts < ActiveRecord::Migration
  def change
    add_column :hosts, :post_id, :integer
  end
end
