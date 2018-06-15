Rails.application.routes.draw do
    # devise_for :users do
    #   get 'sign_out' => 'sessions#destroy'
    #   delete 'logout', to: 'sessions#destroy'
    #   get 'login', to: 'sessions#new'
    #   get 'signup' => 'registrations#new'
    # end

    # devise_for :users do
    #   get 'sign_out' => 'sessions#destroy'
    #   delete 'logout', to: 'sessions#destroy'
    #   get 'login', to: 'sessions#new'
    #   get 'signup' => 'registrations#new'
    # end, controllers: { registrations: 'users/registrations' }



    # Rails.application.routes.draw do
    #   devise_for :users, controllers: {
    #     sessions: 'users/sessions'
    #   }
    # end


  devise_scope :user do
    delete 'logout', to: 'users/sessions#destroy'
    get 'login', to: 'users/sessions#new'
    get 'signup' => 'users/registrations#new'
    post 'signup' => 'users/registrations#create'
    post 'login' => 'users/sessions#create'
  end


  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get 'create_card' => 'pagos#create_card'
  get 'divisas' => 'home#divisas'
  get 'send_email_info' => 'pagos#send_email_info'
  get 'receive_get_params' => 'pagos#receive_get_params'
  get 'test_get_request' => 'pagos#test_get_request'
  get 'users/sign_out' => 'devise/sessions#destroy'
  get 'test_post_request' => 'pagos#test_post_request'
  post 'billings/generate_payment' => 'billings#generate_payment'
  post 'billings/charge_customer' => 'billings#charge_customer'
  get 'billings' => 'billings#index'
  get 'test' => 'home#test'
  post 'test_captcha' => 'home#test_captcha'
end
