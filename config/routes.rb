Rails.application.routes.draw do
  # Les routes gardens, on nest la route du create pour obtenir l'id du garden
  # lors de la création de la plant.
  resources :gardens do
    resources :plants, only: [:create]
  end

  # Le destroy n'a pas besoin de l'id du garden pour delete la plante, son id suffit.
  resources :plants, only: [:destroy]
end
