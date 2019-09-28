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
  get 'search/' => 'books#search', :as => :search
  post 'bookmark' => 'books#bookmark', :as => :bookmark
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
