json.array!(@products) do |product|
  json.extract! product, :id, :titulo, :descricao, :preco
  json.url product_url(product, format: :json)
end
