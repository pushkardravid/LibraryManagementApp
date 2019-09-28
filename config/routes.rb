Rails.application.routes.draw do
  root 'landing#index'
  devise_for :librarians, controllers: { sessions: 'librarian/sessions', registrations: 'librarian/registrations' }
  devise_for :admins, controllers: { sessions: 'admin/sessions', registrations: 'admin/registrations' }
  devise_for :students, controllers: { sessions: 'student/sessions', registrations: 'student/registrations' }
  resources :borrowing_histories
  resources :book_hold_requests
  resources :librarians
  resources :students
  resources :libraries
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
