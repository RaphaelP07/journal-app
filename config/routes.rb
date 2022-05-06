Rails.application.routes.draw do
  resources :categories do
    resources :tasks
  end

  get '/categories/tasks/today' => 'categories#today', as: 'today_tasks'
end
