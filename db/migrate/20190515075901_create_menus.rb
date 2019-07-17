class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :menu_name
      t.text :description

      t.timestamps
    end
  end
end
