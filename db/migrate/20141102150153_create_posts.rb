class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :link
      t.string :short_url
      t.datetime :tweeted_on, :datetime, default: nil
      t.timestamps null: false
    end
  end
end
