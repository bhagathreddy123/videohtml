class Video < ActiveRecord::Base
	extend FriendlyId
#friendly_id :title, use: :slugged
friendly_id :title, use: [:slugged, :finders,:history]
mount_uploader :media, VideoUploader
validates :title, :description, :presence => true 

def video_screenshot
	screenshot_path = Rails.root+"/app/assets/images/screenshots/#{self.slug}_#{self.id}.jpg"
	if FileTest.exists?(screenshot_path)
		@screenshot = screenshot_path
	else
		video_file = FFMPEG::Movie.new("#{Rails.root}/public"+self.video.url(:mp4))
		@screenshot = video_file.screenshot("#{screenshot_path}")
	end
end

process_in_background :media

def self.get_other_videos(video_id)
videos = Video.where.not(id: video_id) rescue nil
return videos
end



end
