Spree::Core::Engine.routes.prepend do
  match 'suggestions', to: 'suggestions#index'
  namespace :admin do
  	resources :suggestions
  end
end
