Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :abouts, only: [:index]
      resources :projects, only: %i[index show create update destroy] do
        get 'find_by_name', on: :collection
      end
      resources :educations, only: %i[index show create update destroy] do
        get 'find_by_name', on: :collection
        resources :education_contents, only: %i[index show create update destroy]
      end
    end
  end
end
