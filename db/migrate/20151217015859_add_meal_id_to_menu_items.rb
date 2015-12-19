class AddMealIdToMenuItems < ActiveRecord::Migration
  def change
  	add_column :menu_items, :meal_id, :integer
  end
end
