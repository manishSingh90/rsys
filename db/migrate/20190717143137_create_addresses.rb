class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :country
      t.string :state
      t.integer :zip
      t.references :user, foreign_key: true
      # t.belongs_to :user, index: { unique: true }, foreign_key: true
      t.timestamps
    end
  end
end
