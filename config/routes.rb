Rails.application.routes.draw do
    
    scope "(:locale)", locale: /en|es|de/ do
    
        get '/:locale' => 'insurances#index'
        root to: 'insurances#index'
        
        get 'pages/landing' => 'pages#landing'
        get 'pages/impressum' => 'pages#impressum'
        get 'pages/termsAndConditions' => 'pages#termsAndConditions'
        get 'pages/submitted' => 'pages#submitted'
        get 'pages/guidelines' => 'pages#guidelines'
        get 'pages/guidelines' => 'pages#guidelines'
        get 'pages/advice' => 'pages#advice'
        get 'pages/contactedExporter' => 'pages#contactedExporter'
        get 'pages/broker_overview' => 'pages#broker_overview'
        get 'pages/forgotten_password' => 'pages#forgotten_password'
        get 'pages/overview' => 'pages#overview'
        get 'pages/register_account' => 'pages#register_account'
        get 'pages/welcome' => 'pages#welcome'
        
        resources :insurances do
          member do
            get 'submitted_applications'
            get 'approved_applications'
            get 'user_summary'
            get 'pdf_user_summary'
          end
        end

        resources :export_applications
    end
    
    devise_for :users,
               path:        '',
               path_names:  {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
               controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

    resources :users, only: [:show]
end
