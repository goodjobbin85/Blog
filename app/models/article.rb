class Article < ApplicationRecord
	belongs_to :user
	validates :name, :title, :description, presence: :true
	validates :description, length: { minimum: 10, maximum: 200 }
	validates :user_id, presence: true
end
