Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :educations
      resources :education_contents
    end
  end
end