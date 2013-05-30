Spree::Core::Engine.routes.draw do
  match 'suggestions', to: 'suggestions#index'
  namespace :admin do
  	resources :suggestions
  end
end
