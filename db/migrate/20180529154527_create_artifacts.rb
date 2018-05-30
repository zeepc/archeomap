class CreateArtifacts < ActiveRecord::Migration[5.2]
  def change
    create_table :artifacts do |t|
      t.string :objectID
      t.string :title
      t.string :alt_title
      t.string :pic_sm_url
      t.string :pic_lg_url
      t.string :audio
      t.string :location
      t.string :era
      t.string :timeline_url
      t.timestamps
    end
  end
end
