Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/parents', to: 'parents#index'
  get '/parents/new', to: "parents#new"
  post '/parents', to: 'parents#create'
  get '/parents/:id', to: "parents#show"
  get '/parents/:id/edit', to: "parents#edit"
  patch '/parents/:id', to: "parents#update"
  delete '/parents/:id', to: "parents#destroy"
end
