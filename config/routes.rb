Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "questions#index"
  resources :questions do
    resources :answers  # questionsルート（/questions/...）に紐づくanswersルートが作成される（/questions/:question_id/answers）。
  end
end
