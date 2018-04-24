Rails.application.routes.draw do
  get 'astros/feed'
  get 'rates/feed'
  get 'rates/refresh'
  resources :rates
  resources :reports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
