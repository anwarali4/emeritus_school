class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  

  validates :name, :type, :email, presence: true
  ROLE = %w(Admin SchoolAdmin Student)
  GENDER = %w(Male Female)
  validates :type, inclusion: { in: ROLE }

  ROLE.each do |method|
    define_method "#{method.downcase}?" do
      type == method
    end
  end

end
