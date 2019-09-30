class ApplicationController < ActionController::Base
	before_action :get_user
	
	BOOK_SPECIFICATIONS = {:undergraduate => 3, :graduate => 5, :phd => 8}.freeze


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
