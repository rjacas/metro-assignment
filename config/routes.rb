Rails.application.routes.draw do
  get 'health', to: 'health#show'
  root to: 'health#show'
  resources :route, except: [:index, :create, :show, :update, :destroy] do
    collection do
      post :best_route
      #post :save_massive
      #post :day_log
      #post :speed_limit
    end
  end
end
