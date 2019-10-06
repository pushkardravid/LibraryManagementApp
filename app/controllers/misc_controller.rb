class MiscController < ApplicationController
	before_action :authenticate_admin!, except: [:index], if: -> { :admin_signed_in?  }
	before_action :authenticate_student!, except: [:index], if: -> { :student_signed_in? }
	before_action :authenticate_librarian!, except: [:index], if: -> { :librarian_signed_in?  }


	def index
	end

	def librarian_approval
		@pending_librarians = Librarian.where(approved: nil)
	end

	def admin_dashboard
	end

end
