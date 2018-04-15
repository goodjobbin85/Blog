class Category < ApplicationRecord
	has_many :article_categories
	has_many :articles, through: :article_categories
	validates :name, presence: true, uniqueness: true
	validates :name, length: { maximum: 25, minimum: 4}
end 