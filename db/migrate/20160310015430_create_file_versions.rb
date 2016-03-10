class CreateFileVersions < ActiveRecord::Migration
  def change
    create_table :file_versions do |t|
      t.references :file_upload, index: true, foreign_key: true
      t.integer :file_version

      t.timestamps null: false
    end
  end
end
