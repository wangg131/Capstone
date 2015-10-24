json.array!(@matches) do |match|
  json.extract! match, :id, :post_id, :profile_id, :approved?
  json.url match_url(match, format: :json)
end
