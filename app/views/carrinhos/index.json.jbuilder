json.array!(@carrinhos) do |carrinho|
  json.extract! carrinho, :id
  json.url carrinho_url(carrinho, format: :json)
end
