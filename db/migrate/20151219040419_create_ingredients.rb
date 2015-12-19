class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :alert_id
      t.integer :allergy_id
      t.integer :menu_item_id
      t.timestamps
    end
  end
end
