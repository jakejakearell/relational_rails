Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/games', to: 'games#index'
  get '/video_stores', to: 'video_stores#index'
  get '/games/new', to: "games#new"
  post '/games', to: "games#create"
  get '/video_stores/new', to: "video_stores#new"
  post '/video_stores', to: "video_stores#create"
  get '/parents/:id', to: "parents#show"
  get '/parents/:id/edit', to: "parents#edit"
  patch '/parents/:id', to: "parents#update"
  delete '/parents/:id', to: "parents#destroy"
end
