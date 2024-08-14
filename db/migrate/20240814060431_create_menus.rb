class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.string :cuisine
      t.string :main_ingredient
      t.boolean :is_soup
      t.boolean :is_noodle

      t.timestamps
    end
  end
end
