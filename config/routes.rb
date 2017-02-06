Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'home' => 'home#index'


  post 'auth_user' => 'authentication#authenticate_user'


  namespace :api do
    namespace :v1 do
      resources :predictions do
        resources :prediction_comments
        resources :prediction_categories
        resources :prediction_experts
        resources :prediction_evidences
        resources :prediction_votes
      end

      resources :claims do
        resources :claim_comments
        resources :claim_experts
        resources :claim_categories
        resources :claim_evidences
        resources :claim_votes
      end

      resources :categories

      resources :experts do
        resources :expert_categories
        resources :expert_claims
        resources :expert_comments
      end

      resources :publications do
        resources :publication_comments
      end

      resources :users
    end
  end
end
