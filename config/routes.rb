Rails.application.routes.draw do
  root 'welcome#index'

  resources :projects, only: [:index, :create, :update, :destroy] do
    resources :tasks, only: [:create, :update, :destroy] do
    	member do 
    		patch '/task_up', to: 'tasks#task_up'
  			patch '/task_down', to: 'tasks#task_down'
  		end
  	end
  end

  resource :persons, only: [:show, :update]

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
end
