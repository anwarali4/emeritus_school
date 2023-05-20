class Enrollment < ApplicationRecord
  STATUS = ['pending', 'approve', 'reject']
  enum status: STATUS

  belongs_to :batch
  belongs_to :student

end
