# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base

  include CarrierWave::MimeTypes
  include CarrierWave::Video
  include ::CarrierWave::Backgrounder::Delay


  storage :file

  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

 
  version :screenshot do
    process :screenshot
  end
version :mp4 do
process :encode
end


  DEFAULTS = {
    watermark: {
      path: Rails.root.join('mutube.png')
    }
  }

  
end
