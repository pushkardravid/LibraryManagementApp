class Student::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  
    def facebook
      @student = Student.from_omniauth(request.env["omniauth.auth"])
      if request.env["omniauth.auth"].info.email.blank?
        redirect_to "/students/auth/facebook?auth_type=rerequest&scope=email"
        return
      end
      if @student.persisted?
        sign_in_and_redirect @student, event: :authentication
        set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to new_student_registration_url
      end
    end
    def failure
      redirect_to root_path
    end
   end