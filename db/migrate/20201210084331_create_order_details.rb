class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      # 注文id
      t.integer :order_id,      null: false
      # 商品id
      t.integer :item_id,       null: false
      # 購入時価格
      t.integer :price,         null: false
      # 数量
      t.integer :amount,        null: false
      # 製造ステータス
      # 0:製作不可 1:製作待ち 2:製作中 3:製作完了
      t.integer :making_status, null: false, default: "0"

      t.timestamps
    end
  end
end
