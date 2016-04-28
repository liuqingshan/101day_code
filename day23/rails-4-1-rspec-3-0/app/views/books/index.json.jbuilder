json.array!(@books) do |book|
  json.extract! book, :id, :title, :isbn, :publish_at
  json.url book_url(book, format: :json)
end
