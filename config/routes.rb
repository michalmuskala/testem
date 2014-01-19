Testem::Application.routes.draw do

  devise_for :users
  resources :quizzes, only: [:show, :index] do
    resources :solutions, only: [:new]
  end
  resources :solutions, only: [:create, :show, :index] do
    get :deliver, on: :member
  end

  namespace :admin do
    resources :quizzes
    resources :users
    root to: 'quizzes#index'
  end

  root to: 'quizzes#index'
end
