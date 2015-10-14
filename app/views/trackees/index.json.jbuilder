json.array!(@trackees) do |trackee|
  json.extract! trackee, :id, :name, :last_login, :login_count, :trackBrowser, :track, :flag
  json.url trackee_url(trackee, format: :json)
end
