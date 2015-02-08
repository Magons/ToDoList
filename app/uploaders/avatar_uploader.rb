class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick
  storage :file

  def store_dir
    "img"
  end

  version :thumb do
    process :resize_to_limit => [50, 50]
  end
end
