class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true

  def full_address
    "#{line_1}, #{line_2} #{city}, #{state}, #{country}, #{pincode}"
  end
end
