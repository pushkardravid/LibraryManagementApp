class LibrarianDashboardController < ApplicationController
	before_action :test_user

	def test_user
		if not (admin_signed_in? or librarian_signed_in?)
			redirect_to('/librarians/sign_in')
		end
	end
end
