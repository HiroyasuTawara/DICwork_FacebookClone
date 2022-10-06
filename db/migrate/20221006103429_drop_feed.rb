class DropFeed < ActiveRecord::Migration[6.1]
  def up
    drop_table :feeds
  end
  def down
    create_table :feeds do |t|
      t.text :image
      t.bigint :blog_id
      t.timestamps
    end
  end
end
