class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name
      t.numeric :price
      t.references :menu, foreign_key: true

      t.timestamps
    end
  end
end
