# encoding: utf-8
class NewsAttachmentUploader < CarrierWave::Uploader::Base
  storage :file

  def extension_white_list
    /(image\/|video\/)/
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
