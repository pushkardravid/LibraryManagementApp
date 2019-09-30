Rails.application.routes.draw do
  root 'landing#index'
  devise_for :librarians, controllers: { sessions: 'librarian/sessions', registrations: 'librarian/registrations' }
  devise_for :admins, controllers: { sessions: 'admin/sessions', registrations: 'admin/registrations' }
  devise_for :students, controllers: { sessions: 'student/sessions', registrations: 'student/registrations' }
  resources :borrowing_histories
  resources :book_hold_requests
  resources :students
  resources :libraries
  resources :books
  resources :librarians
  get 'admin_dashboard/' => 'admin_dashboard#index', :as => :admin_dashboard
  get 'approve_librarian/:id' => 'librarians#approve_librarian', :as => :approve_librarian
  get 'librarian_dashboard/' => 'librarian_dashboard#index', :as => :librarian_dashboard
  get 'student_dashboard/' => 'student_dashboard#index', :as => :student_dashboard
  post 'checkout/:id' => 'books#checkout_book', :as => :checkout
  post 'request/:id' => 'books#request_book', :as => :request
  post 'return/:id' => 'books#return_book', :as => :return
  get 'bookmarks/:id' => 'books#bookmark_toggle', :as => :bookmark
  get 'bookmarks/' => 'books#view_bookmarks', :as => :get_bookmark
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
