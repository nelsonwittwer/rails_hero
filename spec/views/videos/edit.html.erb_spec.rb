require 'spec_helper'

describe "videos/edit" do
  before(:each) do
    @video = assign(:video, stub_model(Video,
      :video_title => "MyString",
      :video_description => "MyText",
      :youtube_link => "MyText"
    ))
  end

  it "renders the edit video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => videos_path(@video), :method => "post" do
      assert_select "input#video_video_title", :name => "video[video_title]"
      assert_select "textarea#video_video_description", :name => "video[video_description]"
      assert_select "textarea#video_youtube_link", :name => "video[youtube_link]"
    end
  end
end
