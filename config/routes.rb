StarterRubyRails::Application.routes.draw do

  devise_for :users, :controllers => { :registrations => :registrations } 
  resources :users
  
  mount Lockup::Engine, at: '/lockup'
  # GET     /                                           controllers.Application.index(ref: Option[String])


  authenticated :user do
    devise_scope :user do
      root to: "application#welcome", :as => "application/welcome"
    end
  end

  unauthenticated do
    devise_scope :user do
      root to: "application#index", :as => "application/index"
    end
  end

  get 'application/jobs'

  get 'application/resources'

  get 'application/about'

  # Route for sending job request emails
  match '/jobemails',     to: 'jobemails#new',             via: 'get'
  resources "jobemails", only: [:new, :create]

  match '/contactform',     to: 'contactforms#new',             via: 'get'
  resources "contactforms", only: [:new, :create]

  # # Document detail
  get '/document/:id/:slug', to: 'application#document', constraints: {id: /[-_a-zA-Z0-9]{16}/}, as: :document

  # # Basic search
  get '/search', to: 'application#search', as: :search

  # # Previews
  get '/preview', to: 'application#preview', as: :preview

end
