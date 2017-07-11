class GlucoseLevel < ApplicationRecord
	belongs_to :user
	validates :reading, :user_id, presence: true
	validates :reading, numericality: { only_integer: true }
	validates :reading, length: {is: 1}
end
