require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
	test "Os atributos nao podem ser vazios" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:titulo].any?
		assert product.errors[:descricao].any?
		assert product.errors[:preco].any?
		assert product.errors[:avatar].any?
	end

	test "O preco do produto deve ter algum valor e positivo." do
		product = Product.new(	titulo: "Livro",
								descricao: "Contos")
		product.preco = -1
			assert product.invalid?
			assert_equal ["O preco deve ser positivo."],
			product.errors[:preco]
			
		product.preco = 0
			assert product.invalid?
			assert_equal ["O preco nao pode ser zero."],
			product.errors[:preco]
		
		product.preco = 1
			assert product.valid?
	end	
end
