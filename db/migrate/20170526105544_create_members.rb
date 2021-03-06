class CreateMembers < ActiveRecord::Migration
  def change
    drop_table :members
    create_table :members do |t|
      t.integer :number, null: false #背番号
      t.string:name, null: false #ユーザー名
      t.string:full_name #本名
      t.string:email #メールアドレス
      t.integer :gender, null: false, default: 0 #性別
      t.boolean :administrator, null: false, default: false #管理者フラグ
      t.timestamps null: false
    end
  end
end
