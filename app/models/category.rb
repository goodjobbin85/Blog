class Category < ApplicationRecord
	validates :name, presence: true, uniqueness: true
	validates :name, length: { maximum: 25, minimum: 4}
end 