class FixTypoInArticleCategoriesTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table('atricle_categories', 'article_categories')
  end
end
