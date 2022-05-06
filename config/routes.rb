Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :categories do
    resources :tasks
  end

  get '/categories/tasks/today' => 'categories#today', as: 'today_tasks'
  root to: 'home#index'
end
