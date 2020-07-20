Rails.application.routes.draw do
   devise_for :users, :controllers => {registrations: "registrations", sessions: "sessions", passwords: "passwords"}, path: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  authenticate :user do
    root :to => 'dashboard#index'
    get '/setting' => 'dashboard#edit'
    post '/setting' => 'dashboard#update'
    resources :banks, :currencies, :repayment_records, :credit_card_records
    resources :credit_cards do
      member do
        get 'outstanding'
      end
    end
  end
end