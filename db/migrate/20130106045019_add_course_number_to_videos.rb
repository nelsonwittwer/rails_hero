class AddCourseNumberToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :course_number, :integer
  end
end
