class FileVersion < ActiveRecord::Base
  belongs_to :file_upload
  mount_uploader :file_type, FileTypeUploader

  validates_presence_of :file_type
end
