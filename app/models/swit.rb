class Swit < ActiveRecord::Base
	has_many :sweets
	has_many :sours
	validates :text, presence: true, length: { maximum: 140 }
end
