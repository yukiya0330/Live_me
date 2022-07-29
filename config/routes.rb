Rails.application.routes.draw do
  namespace :public do
    get 'reports/index'
    get 'reports/show'
    get 'reports/new'
  end
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
    namespace :admin do
    get '/' => 'homes#top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, except: [:show]
    resources :artists do
      resource :artist_genres, only: [:new, :create, :destroy, :edit]
    end
    resources :live_houses
    resources :lives
  end
  
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    resources :customers, only: [:show, :edit, :update]
    resources :artists, only: [:show, :index]
    resources :lives, only: [:index, :show, :create]
    resources :live_houses, only: [:index, :show]
    resources :reports
  end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
