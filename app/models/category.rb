class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories

  before_save { self.name = name.capitalize }
  validates :name, presence: true, uniqueness: { case_sensitive: false},
                   length: {minimum: 3, maximum: 25}
end
