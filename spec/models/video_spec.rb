require 'spec_helper'

describe Video do
  let(:video){FactoryGirl.create(:video)}

  it { should respond_to(:video_description) }
  it { should respond_to(:video_title) }
  it { should respond_to(:youtube_link) }
  it { should respond_to(:course_number) }

context "CanCan authorization" do

    context "for users" do
        it "shouldn't allow regular users to create a video" do
          user=FactoryGirl.create(:user)
          ability=Ability.new(user)
          authorize = ability.can? :create, Video
          authorize.should be_false
        end

        it "shouldn't allow regular users to edit a video" do
          user=FactoryGirl.create(:user)
          ability=Ability.new(user)
          authorize = ability.can? :update, Video
          authorize.should be_false
        end

        it "shouldn't allow regular users to delete a video" do
          user=FactoryGirl.create(:user)
          ability=Ability.new(user)
          authorize = ability.can? :delete, Video
          authorize.should be_false
        end
    end

    context "for admins" do
        it "should allow admins to create a video" do
          user=FactoryGirl.create(:admin)
          ability=Ability.new(user)
          authorize = ability.can? :create, Video
          authorize.should be_true
        end 

        it "should allow admins to edit a video" do
          user=FactoryGirl.create(:admin)
          ability=Ability.new(user)
          authorize = ability.can? :update, Video
          authorize.should be_true
        end

        it "should allow admins to delete a video" do
          user=FactoryGirl.create(:admin)
          ability=Ability.new(user)
          authorize = ability.can? :delete, Video
          authorize.should be_true
        end
    end

    context "for mentors" do
      it "should allow mentors to create a video" do
        user=FactoryGirl.create(:mentor)
        ability=Ability.new(user)
        authorize = ability.can? :create, Video
        authorize.should be_true
      end 

      it "should allow mentors to edit a video" do
        user=FactoryGirl.create(:mentor)
        ability=Ability.new(user)
        authorize = ability.can? :update, Video
        authorize.should be_true
      end

      it "should not allow mentors to delete a video" do
        user=FactoryGirl.create(:mentor)
        ability=Ability.new(user)
        authorize = ability.can? :delete, Video
        authorize.should be_false
      end
    end  

    end


end
