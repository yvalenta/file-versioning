class FileVersion < ActiveRecord::Base
  belongs_to :file_upload
  mount_uploader :file_type, FileTypeUploader

  has_many :comments, as: :commentable, :dependent => :destroy
  #validates_presence_of :file_type
end
