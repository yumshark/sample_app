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
