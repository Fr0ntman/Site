class CourseBgUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def extension_white_list
    /image\//
  end
 
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :thumb do
    process resize_to_fill: [150, 100]
  end

  version :card do
    process resize_to_fill: [280, 150]
  end

end
