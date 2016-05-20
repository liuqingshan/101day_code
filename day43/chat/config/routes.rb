Rails.application.routes.draw do
  get "rooms/show"

  mount ActionCable.server => "/cable"
end
