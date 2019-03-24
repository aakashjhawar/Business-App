Rails.application.routes.draw do
  resources :qualities
  root 'welcome#home'
  resources :parties
  get '/parties' => 'parties#index', :as => 'search_party_page'
  get '/qualities' => 'qualities#index', :as => 'search_quality_page'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
