require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
	fixtures :products
  
	test"O titulo deve ser unico" do
		product=Product.new(titulo: products(:ruby).titulo,
							descricao:"yyy",
							preco: 1)
		assert product.invalid?
		assert_equal ["titulo ja existe"], product.errors[:titulo]
	end

	test "Os atributos nao podem ser vazios" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:titulo].any?
		assert product.errors[:descricao].any?
		assert product.errors[:preco].any?
	end
	
#	test "Os atributos nao podem ser vazios" do
#		product = Product.new
#		assert product.invalid?
#		assert product.errors[:titulo].any?
#		assert product.errors[:descricao].any?
#		assert product.errors[:preco].any?
#		assert product.errors[:avatar].any?
#	end

	test "O preco do produto deve ter um valor positivo." do
		product = Product.new(	titulo: "Livro",
								descricao: "Contos")
		product.preco = -1
			assert product.invalid?
			assert_equal ["O preco deve ser positivo."],
			product.errors[:preco]
	end

	test "O preco do produto deve ser diferente de zero." do
		product = Product.new(	titulo: "Livro",
								descricao: "Contos")
		product.preco = 0
			assert product.invalid?
			assert_equal ["O preco nao pode ser zero."],
			product.errors[:preco]
	end	

	test "O preco do produto deve ter um valor minimo." do
		product = Product.new(	titulo: "Livro",
								descricao: "Contos")
		product.preco = 1
			assert product.invalid?
	end

end