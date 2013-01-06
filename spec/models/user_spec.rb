require 'spec_helper'

describe User do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  context "registration proces" do
    it "should be valid with factory defaults" do
      @user.should be_valid
    end

    it "should not be valid without a name " do
      @user.user_name = nil
      @user.should_not be_valid
    end

    it "should require an email address" do
      @user.email = nil
      @user.should_not be_valid
    end

    it "should require an encrypted password" do
      @user.password = nil
      @user.should_not be_valid
    end
  end
  context "CanCan Authorization" do
    context "for users" do
      before(:each) do
        @user2=FactoryGirl.create(:user)
      end
      it "should allow a user to edit his own profile" do
          ability=Ability.new(@user)
          authorize = ability.can? :update, @user
          authorize.should be_true
      end

      it "shouldn't allow regular user to edit another user" do
          ability=Ability.new(@user)
          authorize = ability.can? :update, @user2
          authorize.should be_false
      end

      it "shouldn't allow regular user to delete another user" do
          ability=Ability.new(@user)
          authorize = ability.can? :destroy, @user2
          authorize.should be_false
      end

      it "shoudl allow a regular user to delete their own account" do
          ability=Ability.new(@user)
          authorize = ability.can? :destroy, @user
          authorize.should be_true
      end
    end
    context "for students" do
      before(:each) do
        @student=FactoryGirl.create(:student)
        @student2=FactoryGirl.create(:student)
      end
      it "should allow a student to edit his own profile" do
          ability=Ability.new(@student)
          authorize = ability.can? :update, @student
          authorize.should be_true
      end

      it "shouldn't allow regular student to edit another student" do
          ability=Ability.new(@student)
          authorize = ability.can? :update, @student2
          authorize.should be_false
      end

      it "shouldn't allow regular student to delete another student" do
          ability=Ability.new(@student)
          authorize = ability.can? :destroy, @student2
          authorize.should be_false
      end

      it "shoudl allow a regular student to delete their own account" do
          ability=Ability.new(@student)
          authorize = ability.can? :destroy, @student
          authorize.should be_true
      end
    end
    context "for mentors" do
      before(:each) do
        @mentor=FactoryGirl.create(:mentor)
        @mentor2=FactoryGirl.create(:mentor)
      end
      it "should allow a mentor to edit his own profile" do
          ability=Ability.new(@mentor)
          authorize = ability.can? :update, @mentor
          authorize.should be_true
      end

      it "shouldn't allow regular mentor to edit another mentor" do
          ability=Ability.new(@mentor)
          authorize = ability.can? :update, @mentor2
          authorize.should be_false
      end

      it "shouldn't allow regular mentor to delete another mentor" do
          ability=Ability.new(@mentor)
          authorize = ability.can? :destroy, @mentor2
          authorize.should be_false
      end

      it "shoudl allow a regular mentor to delete their own account" do
          ability=Ability.new(@mentor)
          authorize = ability.can? :destroy, @mentor
          authorize.should be_true
      end
    end
    context "for admins" do
      before(:each) do
        @admin=FactoryGirl.create(:admin)
        @admin2=FactoryGirl.create(:admin)
      end
      it "should allow a admin to edit his own profile" do
          ability=Ability.new(@admin)
          authorize = ability.can? :update, @admin
          authorize.should be_true
      end

      it "should allow regular admin to edit another admin" do
          ability=Ability.new(@admin)
          authorize = ability.can? :update, @admin2
          authorize.should be_true
      end

      it "should allow regular admin to delete another admin" do
          ability=Ability.new(@admin)
          authorize = ability.can? :destroy, @admin2
          authorize.should be_true
      end

      it "should allow a regular admin to delete their own account" do
          ability=Ability.new(@admin)
          authorize = ability.can? :destroy, @admin
          authorize.should be_true
      end
    end
  end
end