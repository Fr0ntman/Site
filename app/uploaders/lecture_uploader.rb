class LectureUploader < CarrierWave::Uploader::Base
  storage :file

  def extension_white_list
    ['application/pdf','application/zip']
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
