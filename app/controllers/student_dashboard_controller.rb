class StudentDashboardController < ApplicationController
	before_action :test_user

	def test_user
		if not (admin_signed_in? or student_signed_in?)
			redirect_to('/students/sign_in')
		end
	end
end
