class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      # 会員id
      t.integer :customer_id, null: false
      # 宛名
      t.string         :name, null: false
      # 郵便番号
      t.string  :postal_code, null: false
      # 住所
      t.string      :address, null: false

      t.timestamps
    end
  end
end
