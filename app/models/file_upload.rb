class FileUpload < ActiveRecord::Base
  has_many :file_versions, :dependent => :destroy
  mount_uploader :file_type, FileTypeUploader
end
