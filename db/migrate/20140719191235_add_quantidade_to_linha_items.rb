class AddQuantidadeToLinhaItems < ActiveRecord::Migration
  def change
    add_column :linha_items, :quantidade, :integer, default: 1
  end
end
