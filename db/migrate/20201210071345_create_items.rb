class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      # ジャンルid
      t.integer :genre_id,     null: false
      # 商品名
      t.string  :name,         null: false
      # 商品画像id
      t.string  :image_id,     null: false
      # 商品説明文
      t.text    :introduction, null: false
      # 税抜き価格
      t.integer :price,        null: false
      # 販売ステータス
      t.boolean :is_active,    null: false, default: "TRUE"

      t.timestamps
    end
  end
end
