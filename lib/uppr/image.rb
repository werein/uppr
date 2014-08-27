module Uppr
  class Image < CarrierWave::Uploader::Base
    include ::CarrierWave::Backgrounder::Delay
    # Include RMagick or MiniMagick support:
    # include CarrierWave::RMagick
    include CarrierWave::MiniMagick

    # # Include the Sprockets helpers for Rails 3.1+ asset pipeline compatibility:
    # include Sprockets::Rails::Helper

    # Choose what kind of storage to use for this uploader:
    storage Uppr.configuration.image

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    # Provide a default URL as a default if there hasn't been a file uploaded:
    def default_url
      ActionController::Base.helpers.asset_path('fallback/' + [version_name, 'default.png'].compact.join('_'))
    end

    before :store, :remember_cache_id
    after :store, :delete_tmp_dir

    # store! nil's the cache_id after it finishes so we need to remember it for deletion
    def remember_cache_id(new_file)
      @cache_id_was = cache_id
    end
    
    def delete_tmp_dir(new_file)
      # make sure we don't delete other things accidentally by checking the name pattern
      if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
        FileUtils.rm_rf(File.join(root, cache_dir, @cache_id_was))
      end
    end

    # Process files as they are uploaded:
    # process :scale => [200, 300]
    #
    # def scale(width, height)
    #   # do something
    # end

    version :original do 
      process resize_to_limit: [1920, nil]

      version :thumb do
        process resize_to_limit: [720, nil]
      end
    end

    version :square do
      process resize_to_fill: [1920, 1920]

      version :thumb do 
        process resize_to_fill: [720, 720]
      end
    end

    version :portrait do 
      process resize_to_fill: [1080, 1920]

      version :thumb do
        process resize_to_fill: [720, 1280]
      end
    end

    version :landscape do
      process resize_to_fill: [1920, 1080]

      version :thumb do 
        process resize_to_fill: [1280, 720]
      end
    end

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

  end
end