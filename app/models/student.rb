class Student < User

  has_one :address, dependent: :destroy
  has_many :enrollments, dependent: :destroy

end
