Rails.application.routes.draw do
  get '/' => 'site#home'
  get '/contact' => 'site#contact'
  get '/proyects' => 'proyect#index'
  get '/proyect/:id' => 'proyect#show'
end


