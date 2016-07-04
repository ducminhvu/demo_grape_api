class API < Grape::API
  prefix "api"
  format :json

  mount User::Sessions
  mount Acme::Ping
end
