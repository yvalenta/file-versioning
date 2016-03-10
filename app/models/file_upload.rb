class FileUpload < ActiveRecord::Base
  has_many :versions#, :dependent => :destroy
end
