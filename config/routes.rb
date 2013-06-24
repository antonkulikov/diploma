Diploma::Application.routes.draw do

  devise_for :users

  match 'reports' => 'reports#index', :as => :reports
  match 'reports/show' => 'reports#show', :as => :show_reports

  match 'search' => 'search#index', :as => :search

  root :to => 'disciplines#index'

  resources :examines do
    collection { post :sort }
  end

  resources :blocks do
    member do
      post :add_groups
      post :add_examines
    end
    collection { get :year }
  end

  resources :repository_themes do
    collection {get :discipline_themes}
  end

  resources :scripts do
    resources :script_themes do
      resources :script_sub_themes
    end
  end

  resources :disciplines

  resources :groups

  resource :session, :only => [:new, :create, :destroy]

  match 'login' => 'sessions#new', :as => :login

  match 'logout' => 'sessions#destroy', :as => :logout

end
