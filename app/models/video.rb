class Video < ActiveRecord::Base
	extend FriendlyId
friendly_id :title, use: :slugged
 # friendly_id :title, use: [:slugged, :finders]
end
