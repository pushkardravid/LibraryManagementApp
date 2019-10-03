class ApplicationController < ActionController::Base
	before_action :get_user

	def home
		if admin_signed_in?
			redirect_to '/admin_dashboard'
		elsif librarian_signed_in?
			redirect_to '/librarian_dashboard'
		elsif student_signed_in?
			redirect_to '/student_dashboard'
		else
			redirect_to request.referrer
		end
	end

	def get_user
		if admin_signed_in?
			user = 'admin'
		elsif librarian_signed_in?
			user = 'librarian'
		elsif student_signed_in?
			user = 'student'
		else
			user = nil
		end

		@current_user = user
		puts @current_user
	end
end
