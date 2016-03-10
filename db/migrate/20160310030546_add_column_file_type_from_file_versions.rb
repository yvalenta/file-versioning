class AddColumnFileTypeFromFileVersions < ActiveRecord::Migration
  def change
    add_column :file_versions, :file_type, :string
  end
end
