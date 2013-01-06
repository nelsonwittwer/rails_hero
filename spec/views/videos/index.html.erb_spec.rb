require 'spec_helper'

describe "videos/index" do
  before(:each) do
    assign(:videos, [
      stub_model(Video,
        :video_title => "Video Title",
        :video_description => "MyText",
        :youtube_link => "MyText"
      ),
      stub_model(Video,
        :video_title => "Video Title",
        :video_description => "MyText",
        :youtube_link => "MyText"
      )
    ])
  end

  it "renders a list of videos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Video Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
