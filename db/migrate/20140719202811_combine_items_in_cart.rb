class CombineItemsInCart < ActiveRecord::Migration
  def change
  end
  
	def up
		carrinho.all.each do |carrinho|
			soma = carrinho.linha_items.group(:product_id).sum(:quantidade)
			soma.each do |product_id, quantidade|
				if quantidade > 1
					carrinho.linha_items.where(product_id: product_id).delete_all
					
					item = carrinho.linha_items.build(product_id: product_id)
					item.quantidade = quantidade
					item.save!
				end
			end
		end
	end
	
	def down
		LinhaItem.where("quantidade > 1").each do |linha_item|
			linha_item.quantidade.times do
				LinhaItem.create carrinho_id: linha_item.carrinho_id, product_id: linha_item.product_id, quantidade: 1
			end	
			linha_item.destroy
		end
	end
end
