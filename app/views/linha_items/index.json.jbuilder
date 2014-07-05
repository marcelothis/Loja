json.array!(@linha_items) do |linha_item|
  json.extract! linha_item, :id, :product_id, :carrinho_id
  json.url linha_item_url(linha_item, format: :json)
end
