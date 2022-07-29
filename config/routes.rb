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
    resources :genres, except: [:show]
    resources :artists do
      resource :artist_genres, only: [:new, :create, :destroy, :edit]
    end
    resources :live_houses
    resources :lives do
      resource :performing_artists, only: [:new, :create, :destroy]
    end  
    resources :comments, only: [:index, :show, :destroy]
  end
  
  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    get 'custmers/request' => 'customers#request'
    get 'custmers/completion' => 'custmers/completion'
    resources :customers, only: [:show, :edit, :update]
    resources :artists, only: [:show, :index, :new, :create] do
      resource :favorite_artists, only: [:create, :destroy]
    end  
    resources :lives, only: [:index, :show, :new,:create] do
      resource :bookmark_lives, only: [:create, :destroy]
    end
    resources :live_houses, only: [:index, :show]
    resources :reports
  end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
