ContactsSinglePageApp::Application.routes.draw do
  root 'contacts#main'

  get '/contactss/main', to: 'contacts#main', as: 'main'

  get '/contacts', to: 'contacts#index'

  post '/contacts', to: 'contacts#create'
end
