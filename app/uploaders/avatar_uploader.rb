class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  version :preview do
    process resize_to_fill: [300, 300]
  end
end
