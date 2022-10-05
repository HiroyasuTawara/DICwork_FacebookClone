class CreateFeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :feeds do |t|
      t.text :image
      t.references :blog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
