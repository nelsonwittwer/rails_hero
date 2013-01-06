class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :video_title
      t.text :video_description
      t.text :youtube_link

      t.timestamps
    end
  end
end
