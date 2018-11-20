class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :label
      t.integer :parent_category_id

      t.timestamps
    end
  end
end
