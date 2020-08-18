Rails.application.routes.draw do
  root 'top_pages#home'
  get '/signup', to: 'staffs#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :staffs do
    resources :reports
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
