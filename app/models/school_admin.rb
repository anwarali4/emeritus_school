class SchoolAdmin < User

  belongs_to :school
  
  #after_create :send_password

  def password_required?
    return false if new_record?
    super
  end

  def send_password
    pass = SecureRandom.hex(6)
    update(password: pass)
    UserMailer.send_password(self, pass).deliver_now
  end

end
