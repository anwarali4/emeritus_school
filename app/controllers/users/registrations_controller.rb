class Users::RegistrationsController < Devise::RegistrationsController

  def new
    @student = Student.new
  end

  def create
  	self.resource = Student.new(student_params)
    self.resource.save
    yield resource if block_given?
    binding.pry
    if resource.persisted?
      if resource.active_for_authentication?
        binding.pry
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        binding.pry
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      binding.pry
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password, :password_confirmation, :gender, :dob, :phone)
  end

end