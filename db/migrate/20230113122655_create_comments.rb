class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|

      # 以下追記
      t.integer :travel_id, null: false
      t.integer :user_id, null: false
      t.string  :comment_body, null: false
      t.timestamps
    end
  end
end
