Vidchat::Application.routes.draw do
  resources :courses

  root to: "pages#home"

  resources :enrollments

  resources :sections

  resources :users


  get "/profile" => 'users#profile', :as => :profile

  get "/sessions/new", :as => :signin
  post "/sessions/create"
  get "/sessions/destroy", :as => :signout

  get "/sections/:section_id/get_token" => 'sections#get_token' , :as => :get_token

end
