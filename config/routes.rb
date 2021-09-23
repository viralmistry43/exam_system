Rails.application.routes.draw do
  namespace :v1 do
    resources :questions, only: :index
    resources :answers, only: :create

    get '/user/percentage', to: 'users#user_percentage'
  end
end
