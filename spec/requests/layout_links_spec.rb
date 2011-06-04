require 'spec_helper'

describe "LayoutLinks" do

  it "s have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end                             #{@base_title} |

  it "s have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector('title', :content => 'Contact')
  end

  it "s have an About page at '/about'" do
    get '/about'
    response.should have_selector('title', :content => 'About')
  end

  it "s have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => 'Help')
  end

  it "s have a Signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => 'Sign up')
  end

  it "s have a Signin page at '/signin'" do
    get '/signin'
    response.should have_selector('title', :content => 'Sign in')
  end

  it "s have the right links on the layout" do
    visit root_path
    response.should have_selector('title', :content => 'Home')
    click_link 'About'
    response.should have_selector('title', :content => "About")
    click_link 'Contact'
    response.should have_selector('title', :content => "Contact")
    click_link 'Home'
    response.should have_selector('title', :content => "Home")
    click_link 'Sign up now!'
    response.should have_selector('title', :content => "Sign up")
    response.should have_selector('a[href="/"]>img')
  end
end