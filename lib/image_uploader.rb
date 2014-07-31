require 'pry'

class ImageUploader < CarrierWave::Uploader::Base
 storage :file

 def store_dir
   'lib/app/public/images'
 end

 def self.load(database,image)
   uploader = ImageUploader.new
   if image != nil
     uploader.store!(image)
     database[:image_file] = image[:filename]
   end
 end

end
