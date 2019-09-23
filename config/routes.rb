Rails.application.routes.draw do
  resources :borrowing_histories
  resources :book_hold_requests
  resources :librarians
  resources :students
  resources :libraries
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
