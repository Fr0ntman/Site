# encoding: utf-8
class NewsAttachmentUploader < CarrierWave::Uploader::Base
  storage :file

  def extension_white_list
    %w(jpg jpeg gif png mp4 mpeg avi flv webm mkv ogg gif mov)
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
