# frozen_string_literal: true

Spina::Engine.routes.draw do
  namespace :admin do
    namespace :case_studies, path: '' do
      resources :case_studies
      resources :testimonials
    end
  end

  namespace :case_studies, path: '' do
    resources :case_studies, path: '/case-studies', only: %i[index show]
  end
end
