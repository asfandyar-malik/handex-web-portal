Rails.application.routes.draw do
    
    resources :documents do
        member do
            get 'ocr'
        end
    end
    
    # get 'documents/test' => 'documents#test'
    root to: 'insurances#new'
    
    get 'pages/landing' => 'pages#landing'
    get 'pages/impressum' => 'pages#impressum'
    get 'pages/termsAndConditions' => 'pages#termsAndConditions'
    get 'pages/applicationProcessing' => 'pages#applicationProcessing'
    get 'pages/guidelines' => 'pages#guidelines'

    resources :insurances do
      member do
        get 'submitted_applications'
        get 'approved_applications'
        get 'user_summary'
        get 'pdf_user_summary'
      end
    end

    devise_for :users,
               path:        '',
               path_names:  {sign_in: 'login', sign_out: 'logout', edit: 'profile', sign_up: 'registration'},
               controllers: {omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations'}

    resources :users, only: [:show]
end
