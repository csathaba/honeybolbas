# encoding: utf-8

class HoneyimgUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # version :thumb do
  #   process resize_to_fit: [300, nil]
  #   process crop: '480x640+0+0'
  # end

  version :thumb do
      process resize_to_fill: [80, 80, 'Center']
  end

  version :small do
      process :process_original_version
  end

  # version :small do
  #   if :width < :height
  #     process resize_to_fill: [480, 640, 'Center']
  #   else
  #     process resize_to_fill: [640, 480, 'Center']
  #   end
  # end



  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

protected
    def process_original_version
        image = ::MiniMagick::Image::read(File.binread(@file.file))

        if image[:width] > image[:height]
            resize_to_fill 640, 480
        else
            resize_to_fill 480, 640
        end
    end

end
