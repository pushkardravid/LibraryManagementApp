Rails.application.routes.draw do
  root 'misc#index'

  devise_for :librarians, controllers: { sessions: 'librarian/sessions', registrations: 'librarian/registrations' }
  devise_for :admins, controllers: { sessions: 'admin/sessions', registrations: 'admin/registrations' }
  devise_for :students, controllers: { sessions: 'student/sessions', registrations: 'student/registrations' }

  resources :borrowing_histories
  resources :book_hold_requests
  resources :students
  resources :libraries
  resources :books
  resources :librarians 

  get 'home/' => 'application#home'
  get 'admin_dashboard/' => 'misc#admin_dashboard', :as => :admin_dashboard
  get 'approve_librarian/:id' => 'librarians#approve_librarian', :as => :approve_librarian
  get 'librarian_dashboard/' => 'misc#librarian_dashboard', :as => :librarian_dashboard
  get 'student_dashboard/' => 'misc#student_dashboard', :as => :student_dashboard

  post 'checkout/:id' => 'books#checkout_book', :as => :checkout
  post 'request/:id' => 'books#request_book', :as => :request
  post 'return/:id' => 'books#return_book', :as => :return
  get 'bookmarks/:id' => 'books#bookmark_toggle', :as => :bookmark
  get 'bookmarks/' => 'books#view_bookmarks', :as => :view_bookmark
  get 'checkouts/' => 'books#view_checkouts', :as => :view_checkouts
  
  get 'student_hold_requests/' => 'book_hold_requests#student_hold_requests', :as => :student_hold_requests
  get 'book_hold_request_approve/:id' => 'book_hold_requests#approve', :as => :approve_book_hold_request

  get 'librarian_approval/' => 'misc#librarian_approval', :as => :librarian_approval

  get 'libraries_overdue/:id' => 'libraries#overdue_books', :as => :libraries_overdue

end
