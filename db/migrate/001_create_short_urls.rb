class CreateShortUrls < ActiveRecord::Migration
  def self.up
    create_table :short_urls do |t|
      t.text    :url
      t.integer :shortable_id
      t.string  :shortable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :short_urls
  end
end