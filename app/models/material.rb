class Material < ActiveRecord::Base
	mount_uploader :file, MaterialUploader

  belongs_to :lecture
end
