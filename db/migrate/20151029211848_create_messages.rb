class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text    body
      t.integer conversation_id
      t.integer user_id
    end
  end
end
