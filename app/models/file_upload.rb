class FileUpload < ActiveRecord::Base
  has_many :file_versions, :dependent => :destroy
  has_many :comments, as: :commentable, :dependent => :destroy

  mount_uploader :file_type, FileTypeUploader
end
