Rails.application.routes.draw do
  get "_status" => "status#index"
end
