class CreateLinhaItems < ActiveRecord::Migration
  def change
    create_table :linha_items do |t|
      t.references :product, index: true
      t.belongs_to :carrinho, index: true

      t.timestamps
    end
  end
end
