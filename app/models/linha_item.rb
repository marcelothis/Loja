class LinhaItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :carrinho
  
	def item_total
		product.preco * quantidade
	end
end
