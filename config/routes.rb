Testem::Application.routes.draw do

  devise_for :users
  get 'quizzes/:id', to: 'quizzes#show', as: :quiz

  namespace :admin do
    resources :quizzes
    resources :users
    root to: 'quizzes#index'
  end

  root to: 'quizzes#index'
end
