class MiscController < ApplicationController
	before_action :authenticate_admin!, except[:index], if: -> { :admin_signed_in?  }
	before_action :test_user, except[:index], unless: -> { :admin_signed_in? }

	def index
	end

	def librarian_approval
		@pending_librarians = Librarian.where(approved: nil)
	end

	def admin_dashboard
	end

	def librarian_dashboard
	end

	def student_dashboard
	end

	def test_user_student
		if not (admin_signed_in? or student_signed_in?)
			redirect_to('/students/sign_in')
		end
		if not (admin_signed_in? or librarian_signed_in?)
			redirect_to('/librarians/sign_in')
		end
	end

end
