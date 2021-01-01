class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string        :title
      t.text          :overview
      t.integer       :genre_id
      t.references    :user
      t.timestamps
    end
  end
end
