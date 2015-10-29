class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :post_id
      t.integer :profile_id
      t.boolean :host_approved_seeker?
      t.boolean :seeker_approved_host?
    end
  end
end
