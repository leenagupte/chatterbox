Rails.application.routes.draw do
  mount GovukPublishingComponents::Engine, at: "/component-guide" if Rails.env.development?
  
  root to: "chatter#show"
  
  get "/healthcheck/live", to: proc { [200, {}, %w[OK]] }
  get "/healthcheck/ready", to: GovukHealthcheck.rack_response

  get "/chatter", to: "chatter#show"
  post "/chatter", to: "chatter#ask"
end
