class CreateFileUploads < ActiveRecord::Migration
  def change
    create_table :file_uploads do |t|
      t.string :file_name
      t.datetime :uploaded_at
      t.string :description
      t.string :file_type

      t.timestamps null: false
    end
  end
end
