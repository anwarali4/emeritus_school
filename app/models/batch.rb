class Batch < ApplicationRecord
	has_many :enrollment
	belongs_to :course
end
