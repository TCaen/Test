Rails.application.routes.draw do
  devise_for :users 

  resources :users do
    member do
      get 'add' ,to: 'users#add'
      patch 'update_balance', to: 'users#update'
    end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  end
  # Defines the root path route ("/")
   root "pages#home"
end
