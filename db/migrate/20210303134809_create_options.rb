class CreateOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :options do |t|
      t.string     :post_number,   null: false
      t.integer    :prefecture_id, null: false
      t.string     :municipality,  null: false
      t.string     :address,       null: false
      t.string     :building
      t.string     :phone_number,  null: false
      t.integer    :theme_id,      null: false
      t.integer    :flame_id,      null: false
      t.integer    :type_id,       null: false
      t.timestamps
    end
  end
end
