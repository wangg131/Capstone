class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :email
      t.string  :password_digest
      t.string  :phone_number
      t.string  :street
      t.string  :city
      t.string  :state
      t.integer :zip
      t.string  :country
      t.string  :provider
      t.string  :uid
      t.string  :oauth_token
      t.string  :country_code
      t.string  :authy_id
      t.boolean :verified
      t.string  :user_type
    end
  end
end
