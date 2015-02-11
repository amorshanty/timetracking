Rails.application.routes.draw do
	
  get '/' => 'site#home'
  get '/contact' => 'site#contact'

  resources :proyects do
  	resources :entries
  end


  
  # get '/proyects' => 'proyect#index'
  # get '/proyects/:id' => 'proyect#show'
  # get '/proyects/:proyect_id/entries' => 'entries#index', as: "proyect_entries"
  # get 'proyects/:proyect_id/entries/new' => 'entries#new'
  # get '/proyects/:proyect_id/entries/:id' => 'entries#show'

  # post '/proyects/:proyect_id/entries' => 'entries#create'
end
