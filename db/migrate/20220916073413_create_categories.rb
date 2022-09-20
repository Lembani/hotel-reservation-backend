class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, index: true
      t.text :description, null: false
      t.integer :rating, comment: 'Five-star Hotel rating system', limit: 1

      t.timestamps
    end
  end
end
