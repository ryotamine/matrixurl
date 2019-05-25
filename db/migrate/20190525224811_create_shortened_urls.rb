class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.text: long_url
      t.string: short_url
      t.string: sanitize_url
      t.timestamps
    end
  end
end
