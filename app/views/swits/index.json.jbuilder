json.array!(@swits) do |swit|
  json.extract! swit, :id, :text, :poster
  json.url swit_url(swit, format: :json)
end
