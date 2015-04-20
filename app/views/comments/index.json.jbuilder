json.array!(@comments) do |comment|
  json.extract! comment, :id, :author, :body
  json.url polymorphic_url(path_prefix << comment, format: :json)
end
