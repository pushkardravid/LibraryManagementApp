class MiscController < ApplicationController
	#before_action :authenticate_admin!, except: [:admin_dashboard], if: -> { :admin_signed_in?  }
	#before_action :authenticate_student!, except: [:index], if: -> { :student_signed_in? }
	#before_action :authenticate_librarian!, except: [:librarian_dashboard], if: -> { :librarian_signed_in?}


	def index
	end

	def librarian_approval
		@pending_librarians = Librarian.where(approved: nil)
	end

	def admin_dashboard
	end

	def librarian_dashboard
	end

end
