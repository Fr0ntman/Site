# encoding: utf-8
class NewsAttachmentUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick

  storage :file

  def extension_white_list
    /(image\/|video\/)/
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :preview do
    process resize_to_fill: [450, 230]
  end

  version :header_thumb do
    process resize_to_fill: [620, 350]
  end

  version :admin_thumb do
    process resize_to_fill: [275, 180]
  end
end
