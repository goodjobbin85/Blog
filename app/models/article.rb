class Article < ApplicationRecord
	belongs_to :user
	has_many :article_categories
	has_many :categories, through: :article_categories
	validates :name, :title, :description, presence: :true
	validates :description, length: { minimum: 10, maximum: 200 }
	validates :user_id, presence: true
end
