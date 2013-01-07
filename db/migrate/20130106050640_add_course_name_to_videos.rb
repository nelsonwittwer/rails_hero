class AddCourseNameToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :course_name, :string
  end
end
