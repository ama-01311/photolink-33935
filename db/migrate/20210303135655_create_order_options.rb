class CreateOrderOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :order_options do |t|
      t.references :user,     foreign_key: true
      t.references :photo,    foreign_key: true
      t.timestamps
    end
  end
end
