Rails.application.routes.draw do
  root 'welcome#home'
  resources :parties
  get '/index' => 'parties#index', :as => 'search_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
