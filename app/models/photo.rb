class Photo < ActiveRecord::Base

  belongs_to :place

  # Mount up carrierwave uploader
  mount_uploader :photo, PhotoUploader

end
