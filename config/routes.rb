Rails.application.routes.draw do


  root 'dashboard#index'

  devise_for :users, :controllers => {:registrations => "users/registrations"}

  resources :users
  resources :students
  resources :schools
  resources :courses
  resources :batches
  resources :enrollments do
    member do
      get :approve_and_reject
    end
  end
  resources :student_enrollments

  

  namespace :admin do
    resources :students
    resources :schools
  end
  
end
