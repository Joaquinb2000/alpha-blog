class CreateAtricleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :atricle_categories do |t|
      t.integer :article_id
      t.integer :category_id
    end
  end
end
