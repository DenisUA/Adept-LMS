Rails.application.routes.draw do
  resources :translation, only: [:new, :create, :show, :index] do
    get :confirm
    post :receive
  end

  root 'translation#new'
end
