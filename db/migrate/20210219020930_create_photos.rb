class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string     :photo_title,       null: false
      t.text       :photo_description, null: false
      t.integer    :photo_category_id, null: false
      t.integer    :photo_place_id,    null: false
      t.integer    :selling_price,     null: false
      t.references :user,              foreign_key: true
      t.timestamps
    end
  end
end
