Rails.application.routes.draw do

	resources 'entries', only: [:edit, :update, :destroy]

	resources 'projects' do 
		resources 'entries', only: [:new, :create]
	end

  # get'/' => 'sites#home'
  # get '/contact' => 'sites#contact'
  # get '/projects' => 'projects#index'

  # get '/projects/new' => 'projects#new'
  # post '/projects' => 'projects#create'

  # get '/projects/:id' => 'projects#show'
end

