TawaCricketClub::Application.routes.draw do

  get "teams/new"
  get "teams/edit"

  get "payment/index"
  get 'paypal_express/checkout'
  get "paypal_express/review"
  
  get '/juniors/new_form' => "juniors#new_form"
  get '/volunteers/new_form' => "volunteers#new_form"
  get '/teams/new_form' => "teams#new_form"
  get '/senior/new_form' => "senior#new_form"
  get '/teams/get_all_teams' => "teams#get_all_teams"


  get '/juniors/get_all_juniors' => "juniors#get_all_juniors"



  devise_for :members

  resources :members

  resources :member

  resources :admin

  resources :juniors

  resources :seniors

  resources :volunteers

  resources :teams

  resources :contacts

  get "images/gallery"

  resources :image_tables

  resources :images

  get "home/index"
 
  root 'member#index'

  match 'admin/save' => 'admin#save', :via => [:post]
  match 'admin/filter' => 'admin#filter', :via => [:post]
  match 'juniors/create' => 'juniors#create', :via => [:post]
  match 'juniors/get_juniors' => 'juniors#get_juniors', :via => [:post]
  match 'volunteers/create' => 'volunteers#create', :via => [:post]
  match 'senior/create' => 'senior#create', :via => [:post]
  match 'juniors/update_form' => 'juniors#update_form', :via => [:post]
  match 'juniors/update' => 'juniors#update', :via => [:post]





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
