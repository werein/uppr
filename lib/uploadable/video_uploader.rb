module Uploadable
  class VideoUploader < CarrierWave::Uploader::Base
    include ::CarrierWave::Backgrounder::Delay

    # Choose what kind of storage to use for this uploader:
    storage :file

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    version :mp4 do
      process encode: [:mp4]
      def full_filename(for_file)
        "#{File.basename(for_file, File.extname(for_file))}.mp4"
      end
    end

    version :webm do
      process encode: [:webm]
      def full_filename(for_file)
        "#{File.basename(for_file, File.extname(for_file))}.webm"
      end
    end

    version :ogv do
      process encode: [:ogv]
      def full_filename(for_file)
        "#{File.basename(for_file, File.extname(for_file))}.ogv"
      end
    end

    # Add a white list of extensions which are allowed to be uploaded.
    # For images you might use something like this:
    def extension_white_list
      %w(mp4 mov avi mkv 3gp mpg mpeg)
    end
  end
end