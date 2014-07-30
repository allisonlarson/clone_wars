require 'pry'

class ImageUploader < CarrierWave::Uploader::Base
 storage :file

 def store_dir
   'lib/app/public'
 end

 def self.load(database,image)
   image_holder = image
   uploader = ImageUploader.new
   uploader.store!(image_holder)
   database[:image_file] = image_holder[:filename]
 end

end
