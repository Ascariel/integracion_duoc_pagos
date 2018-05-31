Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get 'create_card' => 'pagos#create_card'
  get 'divisas' => 'home#divisas'
  get 'send_email_info' => 'pagos#send_email_info'
  get 'receive_get_params' => 'pagos#receive_get_params'
  get 'test_get_request' => 'pagos#test_get_request'
  # get 'users/sign_out' => 'sessions#destroy'

end
