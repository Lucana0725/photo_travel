class CreateTravels < ActiveRecord::Migration[6.1]
  def change
    create_table :travels do |t|

      # 以下追記
      t.integer :user_id, null: false
      t.string  :title, null: false
      t.text  :body,  null: false
      t.string  :address
      t.float   :latitude
      t.float   :longitude
      t.timestamps
    end
  end
end
