class FileUpload < ActiveRecord::Base
  has_many :file_versions, :dependent => :destroy
end
