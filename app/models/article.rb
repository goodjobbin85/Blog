class Article < ApplicationRecord
	validates :name, :title, :description, presence: :true
	validates :description, length: { minimum: 10, maximum: 200 }
end
