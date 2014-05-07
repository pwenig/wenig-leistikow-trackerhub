Rails.application.routes.draw do
 get '/', to: "dashboard#index"
  get '/projects', to: "projects#index"
  get '/project/:id', to: "projects#show"
end
