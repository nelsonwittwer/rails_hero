require 'spec_helper'

describe "videos/show" do
  before(:each) do
    @video = assign(:video, stub_model(Video,
      :video_title => "Video Title",
      :video_description => "MyText",
      :youtube_link => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Video Title/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
