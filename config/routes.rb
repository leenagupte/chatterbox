Rails.application.routes.draw do
  mount GovukPublishingComponents::Engine, at: "/component-guide" if Rails.env.development?
  
  get "/healthcheck/live", to: proc { [200, {}, %w[OK]] }
  get "/healthcheck/ready", to: GovukHealthcheck.rack_response

  get "/", to: redirect("/chatter")

  get "/chatter", to: "chatter#show"
end
