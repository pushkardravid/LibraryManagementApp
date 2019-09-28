class AdminDashboardController < ApplicationController

	def index
		@pending_librarians = Librarian.where(approved: nil)
	end
end
