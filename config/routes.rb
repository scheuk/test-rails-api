Gfgapi::Application.routes.draw do

  get "gfgusers/create"

  get "gfgusers/update"

  get "gfgusers/show"

  get "gfgusers/fbid"

  devise_for :users

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  #resources :testresourse
  scope 'v1' do
    match 'mischiffs' => 'api/v1/mischiffs#index', :defaults => { :format => 'json' }
    match 'gfgusers' => 'api/v1/gfgusers#create', :via => :post, :defaults => { :format => 'json' }
    match 'gfgusers/:id' => 'api/v1/gfgusers#show', :via => :get, :defaults => { :format => 'json' }
    match 'gfgusers/:id' => 'api/v1/gfgusers#update', :via => :post, :defaults => { :format => 'json' }
    match 'gfgusers/fb/:fbid' => 'api/v1/gfgusers#fbid', :via => :get, :defaults => { :format => 'json' }
    match 'causes' => 'api/v1/causes#index', :via => :get, :defaults => { :format => 'json' }
    match 'causes' => 'api/v1/causes#create', :via => :post, :defaults => { :format => 'json' }
    match 'causes/:id' => 'api/v1/causes#show', :via => :get, :defaults => {:format => 'json'}
    match 'causes/:id' => 'api/v1/causes#update', :via => :post, :defaults => { :format => 'json' }
    match 'causeuser' => 'api/v1/causeuser#create', :via => :post, :defaults => { :format => 'json' }
    match 'causeuser/:id' => 'api/v1/causeuser#update', :via => :post, :defaults => { :format => 'json' }
    match 'donations' => 'api/v1/donations#create', :via => [:get, :post], :defaults => { :format => 'json' }
    match 'donations/:id' => 'api/v1/donations#show', :defaults => { :format => 'json' }
    match 'donations/:id/confirm' => 'api/v1/donations#paypal', :as => :confirm_donation
    match 'donations/:id/cancel' => 'api/v1/donations#cancel', :as => :cancel_donation
  end

  ## Callback URL
  match '/billing/paypal/:id/confirm', :to => 'billing#paypal', :as => :confirm_paypal
  ## Create payment
  match '/billing', :to => 'billing#create', :as => :pay_bill

  ## Request URL
  match '/billing/paypal/:id', :to => 'billing#checkout', :as => :billing
  match '/billing/thank_you/:id', :to => 'billing#thank_you', :as => :billing_thank_you

  get '/paymentform', :to => 'paymentform#index'

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
