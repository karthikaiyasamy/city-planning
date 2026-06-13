class CreatePermitRequests < ActiveRecord::Migration[8.1]
  def change
    create_table :permit_requests do |t|
      t.string :dog_name
      t.string :breed
      t.integer :age
      t.string :owner_name
      t.string :owner_phone
      t.string :status, default: "pending", null: false
      t.string :tag_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :permit_requests, :tag_number, unique: true
  end
end
