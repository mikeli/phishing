Rails.application.routes.draw do

	root 'welcome#index'

	
	resources :saml, only: :index do
		collection do
		  get :sso
		  post :acs
		  get :metadata
		  get :logout
		end
	end

	get 'saml/acs', to: 'saml#index'
	get 'welcome/index'
	get 'welcome/metrics', to: 'welcome#metrics'
end
