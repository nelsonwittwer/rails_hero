class Video < ActiveRecord::Base
  attr_accessible :video_description, :video_title, :youtube_link, :course_number, :course_name
end
