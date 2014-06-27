class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :titulo
      t.text :descricao
      t.decimal :preco, precision: 8, scale: 2

      t.timestamps
    end
  end
end
