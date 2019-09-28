class AdminDashboardController < ApplicationController
	before_action :authenticate_admin!

	def index
		@pending_librarians = Librarian.where(approved: nil)
	end
end
