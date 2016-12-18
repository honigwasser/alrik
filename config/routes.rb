Rails.application.routes.draw do
  opts = { defaults: { format: :json } }

  get "characters/:id/export", opts.merge(to: "characters#export")
  get "characters/:id", opts.merge(to: "characters#show")
  get "characters", opts.merge(to: "characters#index")

  post "characters", opts.merge(to: "characters#create")

  put "characters/:name", opts.merge(to: "characters#update")

  get "_status", to: "status#index" # i'm alive
  post "_dummy", opts.merge(to: "status#dummy") # what you give is what you get
end
