class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text :body, limit: 165
      t.references :user, foreign_key: true
      t.string :image_id

      t.timestamps
    end
  end
end
