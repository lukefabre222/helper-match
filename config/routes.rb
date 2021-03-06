Rails.application.routes.draw do
  root 'top_pages#home'
  get '/new', to: 'top_pages#new', as: 'new_acount'
  get 'staffs/new_shop', to: 'staffs#new_shop', as: 'new_shop'
  get '/signup', to: 'staffs#new'
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/reports/import', to: 'reports#import', as: 'reports_import'
  resources :staffs do
    resources :reports
    resources :events
    resources :likes, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
