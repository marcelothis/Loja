class Carrinho < ActiveRecord::Base

  has_many :linha_items, dependent: :destroy 

	def add_product(product_id)
		item_atual = linha_items.find_by(product_id: product_id)
			if item_atual
				item_atual.quantidade += 1
			else
				item_atual = linha_items.build(product_id: product_id)
			end
		item_atual
	end
	
	def preco_total
		linha_items.to_a.sum { |item| item.item_total }
	end
end
