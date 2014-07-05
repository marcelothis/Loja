class CreateCarrinhos < ActiveRecord::Migration
  def change
    create_table :carrinhos do |t|

      t.timestamps
    end
  end
end
