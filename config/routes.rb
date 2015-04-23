Rails.application.routes.draw do
require 'sidekiq/web'

   resources :videos 
   root "videos#index"
   mount Sidekiq::Web => '/sidekiq'

end
