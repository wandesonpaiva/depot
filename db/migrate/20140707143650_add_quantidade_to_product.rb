class AddQuantidadeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :quantidade, :integer
  end
end
