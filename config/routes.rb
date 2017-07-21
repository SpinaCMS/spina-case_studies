Spina::Engine.routes.draw do
  namespace :admin do
    namespace :case_studies, path: '' do
      resources :case_studies
    end
  end
end
