Rails.application.routes.draw do

  scope module: 'public' do
  root to: 'homes#top'
  get '/about' => "homes#about", as: 'about'
  get "customers/mypage" => "customers#show"
  resources :customers, only: [:edit, :update]
  end

  namespace :admin do
    get 'homes/top'
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
