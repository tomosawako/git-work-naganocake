Rails.application.routes.draw do

  scope module: 'public' do
  root to: 'homes#top'
  get '/about' => "homes#about", as: 'about'
  get "customers/mypage" => "customers#show"
  get "customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"
  get "customers/withdraw_confirm"
  patch "customers/withdraw"
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
