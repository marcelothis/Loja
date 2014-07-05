class Carrinho < ActiveRecord::Base

  has_many :linha_items, dependent: :destroy 

end
