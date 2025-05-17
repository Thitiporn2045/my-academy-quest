Rails.application.routes.draw do
  resources :tasks do
    member do
      patch :toggle_done
    end

    # เพิ่ม route สำหรับแสดง Task ตาม Category
    collection do
      get 'category/:category', to: 'tasks#by_category', as: 'by_category'
    end
  end
  get "up" => "rails/health#show", as: :rails_health_check
end
