Spina::Engine.routes.draw do
  namespace :admin do
    namespace :case_studies, path: '' do
      resources :case_studies
    end
  end

  namespace :case_studies, path: '' do
    resources :case_studies, only: [:index, :show]
  end
end
