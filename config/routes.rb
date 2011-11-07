Findit::Application.routes.draw do
  resources :areas

  resources :projects

  resources :tickets

  resources :operating_systems
  resources :dns_names
  resources :softwares
  resources :locations
  resources :buildings
  resources :items do 
    collection do
      get 'not_checked'
      post 'add_ip'
      get 'remove_ip'
      get 'remove_dns_name' 
      get 'mark_as_inventoried'
      get 'surplus'
    end
  end

  resources :reports, :only=>:index do
    collection do
      get :dns
      get :proc_ratings
      get :upgrades
    end
  end

  resources :ips
  resources :pages
  resources :users do  
    collection do 
      get 'logout'
    end
  end
  resources :installations do
    collection do
      post 'install_software'
      get 'uninstall_software'
    end
  end
  
  resources :announcements
  resources :incoming_email, :only=>[:index]
  match "mail", :to=>"incoming_email#index", :as=>"mail"

  root :to=>"items#index", :type=>"Desktop"
  match "logout", :to=>"users#logout",:as=>"logout"
  match "admin", :to=>"admin#index", :as=>"admin"
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.

end
