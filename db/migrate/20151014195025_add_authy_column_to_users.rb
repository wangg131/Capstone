class AddAuthyColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :country_code, :string
    add_column :users, :authy_id, :string
  end
end
