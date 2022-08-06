Rails.application.routes.draw do
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
    resources :genres, except: [:show] do
      resource :artist_genres, only: [:new, :create, :edit]
      resources :artist_genres, only: [:destroy]
    end
    resources :artists do
      resource :performing_artists, only: [:new, :create]
      resources :performing_artists, only: [:destroy]
    end  
    resources :live_houses do
      resource :live_schedules, only: [:new, :create]
      resources :live_schedules, only: [:destroy]
    end  
    resources :lives
    resources :comments, only: [:index, :show, :destroy]
    resources :reports, only: [:index, :show, :destroy]
  end
  
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    get 'customers/request' => 'customers#request'
    get 'customers/completion' => 'customers/completion'
    resources :customers, only: [:show, :edit, :update]
    resources :artists, only: [:show, :index, :new, :create] do
      resource :favorite_artists, only: [:create, :destroy]
      resource :comments, only: [:create]
      resources :comments, only: [:destroy]
    end
    resources :lives, only: [:index, :show, :new,:create] do
      resource :bookmark_lives, only: [:create, :destroy]
    end
    resources :live_houses, only: [:index, :show]
    resources :reports
    resources :genres, only: [:index] do
      resource :favorite_genres, only: [:create, :destroy]
    end  
  end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
