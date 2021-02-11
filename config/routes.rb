Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/games', to: 'games#index'
  get '/video_stores', to: 'video_stores#index'

  get '/games/new', to: "games#new"
  post '/games', to: "games#create"

  get '/video_stores/new', to: "video_stores#new"
  post '/video_stores', to: "video_stores#create"

  get '/games/:id', to: "games#show"
  get '/games/:id/edit', to: "games#edit"
  patch '/games/:id', to: "games#update"
  delete '/games/:id', to: "games#destroy"

  get '/video_stores/:id', to: "video_stores#show"
  get '/video_stores/:id/edit', to: "video_stores#edit"
  patch '/video_stores/:id', to: "video_stores#update"
  delete '/video_stores/:id', to: "video_stores#destroy"

  get '/players', to: 'players#index'
  get '/movies', to: 'movies#index'

  get '/games/:id/players/new', to: "players#new"
  post 'games/:id/players/new', to: "players#create"
  get '/games/:id/players', to: "games#show_child"
  post '/games/:id/players/new_view', to: "games#new_page"
  get '/games/:id/players/order', to: "games#order"

  get '/video_stores/:id/movies/new', to: "movies#new"
  post 'video_stores/:id/movies/new', to: "movies#create"
  get '/video_stores/:id/movies', to: "video_stores#show_child"
  post '/video_stores/:id/movies/new_view', to: "video_stores#new_page"
  get '/video_stores/:id/movies/order', to: "video_stores#order"

  get '/players/:id', to: "players#show"
  get '/movies/:id', to: "movies#show"

  get '/players/:id/edit', to: "players#edit"
  patch '/players/:id', to: "players#update"
  delete '/players/:id', to: "players#destroy"

  get '/movies/:id/edit', to: "movies#edit"
  patch '/movies/:id', to: "movies#update"
  delete '/movies/:id', to: "movies#destroy"
end
