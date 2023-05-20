class Admin < User
  has_one :address, dependent: :destroy
end
