Rails.application.routes.draw do
  namespace :admin do
    get 'artist_genres/new'
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
  end
  
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
