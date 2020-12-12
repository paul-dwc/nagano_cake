class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      # ジャンル名
      t.string  :name,      null: false
      # 有効ステータス
      t.boolean :is_active, null: false, default: "TRUE"

      t.timestamps
    end
  end
end
