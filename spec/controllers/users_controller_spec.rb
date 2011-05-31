require 'spec_helper'

describe UsersController do
  render_views

  before(:each) do
    @user = Factory(:user)
  end

  describe "Get 'show'" do
    it "s be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "s find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "s have the right title" do
      get :show, :id => @user
      response.should have_selector('title', :content => @user.name)
    end

    it "s have the user's name" do
      get :show, :id => @user
      response.should have_selector('h1', :content => @user.name)
    end

    it "s have a profile image" do
      get :show, :id => @user
      response.should have_selector('h1>img', :class => "gravatar")
    end

    it "s have the right URL" do
      get :show, :id => @user
      response.should have_selector('td>a', :content => user_path(@user),
                                            :href => user_path(@user))
    end
  end

  describe "GET 'new'" do

    it "s be successful" do
      get :new
      response.should be_success
    end

    it "s have the right title" do
      get :new
      response.should have_selector('title', :content => "Sign up")
    end
  end

end
