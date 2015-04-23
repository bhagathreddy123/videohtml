class Video < ActiveRecord::Base
	extend FriendlyId
friendly_id :title, use: :slugged
 # friendly_id :title, use: [:slugged, :finders]
 #mount_uploader :video, VideoUploader
validates :title, :description, :presence => true
end
