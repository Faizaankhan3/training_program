Rails.application.routes.draw do

  root :to => 'sessions#new'
  get 'sessions/new'
  get '/home', to: 'users#home'
  get '/dash', to: 'users#dash'
  get '/summary', to: 'users#summary'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  resources :users do
    member do
      get :delete
      get :change_password
      patch :update_password
    end

    resources :results do
      collection do
        get :view
      end
    end
  end

  resources :exams do
    member do
      get :delete
      get :associate
      put :associate_update
      get :question_paper

    end

    resources :questions do
      member do
        post :update_question
      end
    end
  end

  resources :results do
    member do
      get :delete
      get :disassociate
    end
  end

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
