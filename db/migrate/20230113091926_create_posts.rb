class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      # 以下追記
      t.integer :user_id, null: false
      t.string  :title, null: false
      t.string  :body, null: false
      t.timestamps
    end
  end
end
