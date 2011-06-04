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

  describe "POST 'create'" do

    describe "failure" do
      before(:each) do
        @attr = { :name => '', :email => '', :password => '',
                                             :password_confirmation => ''}
      end

      it "s have the right title " do
        post :create, :user => @attr
        response.should have_selector('title', :content => "Sign up")
      end

      it "s render the new page" do
        post :create, :user => @attr
        response.should render_template('new')
      end

      it "s not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end
    end

    describe "success" do
      before(:each) do
        @attr = {:name => 'Danielle', :email => 'dmtashak@gmail.com',
                 :password => 'patrick', :password_confirmation => 'patrick'}
      end

      it "s create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end

      it "s redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end

      it "s have a welcome message" do
        post :create, :user => @attr
        flash[:success].should =~ /welcome to the sample app/i
      end
    end
  end

end
