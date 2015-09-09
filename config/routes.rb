Rails.application.routes.draw do

	resources 'projects', only:[:index, :create, :new, :show, ]

  # get'/' => 'sites#home'
  # get '/contact' => 'sites#contact'
  # get '/projects' => 'projects#index'

  # get '/projects/new' => 'projects#new'
  # post '/projects' => 'projects#create'

  # get '/projects/:id' => 'projects#show'
end

