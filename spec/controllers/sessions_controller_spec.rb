require 'spec_helper'

describe SessionsController do
  render_views

  describe "GET 'new'" do

    it "s be successful" do
      get :new
      response.should be_success
    end

    it "s have the right title " do
      get :new
      response.should have_selector('title', :content => "Sign in")
    end

  end

  describe "POST 'create'" do

    describe "failure" do
      before(:each) do
        @attr = { :email => '', :password => '' }
      end

      it "s re-render the new page" do
        post :create, :session => @attr
        response.should render_template('new')
      end

      it "s have an error message" do
        post :create, :session => @attr
        flash.now[:error].should =~ /invalid/i
      end

      it "s have the right title" do
        post :create, :session => @attr
        response.should have_selector('title', :content => 'Sign in')
      end
    end
  end

end
