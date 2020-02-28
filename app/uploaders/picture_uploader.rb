class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage ENV['PICTURE_STORAGE'].to_sym
  process resize_to_fit: [360, 360]

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
