class AddOrderOptionToOptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :options, :order_option, null: false, foreign_key: true
  end
end
