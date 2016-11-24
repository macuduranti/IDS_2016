Rails.application.routes.draw do

 # get 'compras/new'

 # get 'compras/index'

 # get 'compras/show'

 # get 'compras/destroy'

 # get 'compras/create'

 # get 'compras/update'

 # get 'compras/edit'

  get 'compras/confirmar', to: 'compras#confirmar'

  get 'compras/agregar', to: 'compras#agregar'

  resources :compras

  resources :logros 

  get 'main/default'
  root to: 'favors#index'

  
  #match 'usuarios/:id' => 'usuarios#destroy', :via => :delete, :as => :admin_destroy_usuario

  devise_for :usuarios, :controllers => { registrations: 'registrations' }

  resources :usuarios, :only => [:index, :show]
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  # You can have the root of your site routed with "root"
 

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

  resources :favors
   get '/gauchadas', to: 'favors#index'
   get '/gauchadas/:id', to: 'favors#show'

  resources :comentarios do
    member do
      post 'comentar/:gau_id', :action => 'comentar', :as => 'comentar'
    end
  end

  resources :postulacions

  get '/elegiruser', to: 'postulacions#elegir_usuario'

end
