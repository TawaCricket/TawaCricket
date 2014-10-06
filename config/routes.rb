TawaCricketClub::Application.routes.draw do



  get "paypalexpress/review"
  get "payment/index"
  get 'paypal_express/checkout'
  get "paypal_express/review"
  
  get '/juniors/new_form' => "juniors#new_form"
  get '/senior/new_form' => "senior#new_form"

  devise_for :members

  resources :members

  resources :member

  resources :juniors

  resources :seniors

  get "images/gallery"


  resources :image_tables

  resources :images

  get "home/index"
 
  root 'member#index'

  match 'juniors/create' => 'juniors#create', :via => [:post]
  match 'senior/create' => 'senior#create', :via => [:post]





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
