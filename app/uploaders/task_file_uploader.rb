class TaskFileUploader < CarrierWave::Uploader::Base
  storage :file

  def extension_white_list
    ['application/pdf','application/zip']
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.task_type}/#{model.id}"
  end
end
