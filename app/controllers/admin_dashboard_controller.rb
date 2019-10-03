class AdminDashboardController < ApplicationController
	before_action :authenticate_admin!

	def index
	end

	def librarian_approval
		@pending_librarians = Librarian.where(approved: nil)
	end

end
