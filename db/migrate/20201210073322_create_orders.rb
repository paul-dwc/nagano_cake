class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      # 会員id
      t.integer :customer_id,    null: false
      # 配送先郵便番号
      t.string  :postal_code,    null: false
      # 配送先住所
      t.string  :address,        null: false
      # 配送先宛名
      t.string  :name,           null: false
      # 送料
      t.integer :shipping_cost,  null: false
      # 請求額
      t.integer :total_payment,  null: false
      # 支払方法
      # 0:クレジットカード 1:銀行振込
      t.integer :payment_method, null: false, default: "0"
      # 注文ステータス
      # 0:入金待ち 1:入金確認 2:製作中 3:発送準備完了 4:発送済み
      t.integer :status,         null: false, default: "0"

      t.timestamps
    end
  end
end
