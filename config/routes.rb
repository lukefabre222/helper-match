Rails.application.routes.draw do
  root 'top_pages#home'
  get '/signup', to: 'staffs#new'
  resources :staffs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
