class School < ApplicationRecord

  has_one :school_admin, dependent: :destroy
  has_one :address, as: :addressable
  has_many :courses, dependent: :destroy

  accepts_nested_attributes_for :school_admin, :address, allow_destroy: true
end
