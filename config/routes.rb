Rails.application.routes.draw do
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
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
  end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
