AdoptAThing::Application.routes.draw do

  devise_for :users, :controllers => {
    passwords: 'passwords',
    registrations: 'users',
    sessions: 'sessions',
  }

  get '/address', to: 'addresses#show', as: 'address'
  get '/info_window', to:'info_window#index', as: 'info_window'
  get '/sitemap', to: 'sitemaps#index', as: 'sitemap'
  get '/workers/index', to: 'workers#index', as: 'workers'
  get '/worker', to: 'workers#index', as: 'workers'
  get '/thing/getCoords', to: 'things#getCoords', as: 'thing'

  scope '/sidebar', controller: :sidebar do
    get :search, as: 'search'
    get :combo_form, as: 'combo_form'
    get :edit_profile , as: 'edit_profile'
  end

  resource :problems
  resource :problem_types
  resource :owners
  resource :reminders
  resource :things
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root to: 'main#index'
end
