require 'spec_helper'

describe "Static pages" do
  
  subject { page} #May omit 'page.' in tests below
  
  describe "Home page" do
    before {visit root_path} #This is the same as before(:each) { .. }
      
    it { should have_selector('h1',        text:'Sample App') }
    it { should have_selector('title',     text: full_title('')) }
    it { should_not have_selector('title', text: '| Home') }
  end
  
  describe "Help page" do
    before { visit help_path }
    
    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end
  
  describe "About page" do
    before { visit about_path }
    
    it { should have_selector('h1',    text: 'About') }
    it { should have_selector('title', text: full_title('About Us')) }
  end
  
  describe "Contact page" do
    before { visit contact_path }
    
    it { should have_selector('h1',    text: 'Contact') }
    it { should have_selector('title', text: full_title('Contact')) }
  end
end
  
#  describe "Help page" do
#    
#    it "should have the h1 'Help'" do
#      visit help_path
#      page.should have_selector('h1', :text => 'Help')
#    end
#    
#    it "should have the title 'Help'" do
#      visit help_path
#      page.should have_selector('title',
#        :text => "Ruby on Rails Tutorial Sample App | Help")
#    end
#  end
#  
#  describe "About page" do
#    
#    it "should have the h1 'About Us'" do
#      visit about_path
#      page.should have_selector('h1', :text => 'About Us')
#    end
#    
#    it "should have the title 'About Us'" do
#      visit about_path
#      page.should have_selector('title',
#        :text => "Ruby on Rails Tutorial Sample App | About Us")
#    end
#    
#  end
#  
#  describe "Contact page" do
#    
#    it "should have the h1 'Contact'" do
#      visit contact_path
#      page.should have_selector('h1', :text => 'Contact')
#    end
#    
#    it "should have the title 'Contact'" do
#      visit contact_path
#      page.should have_selector('title',
#        :text => "Ruby on Rails Tutorial Sample App | Contact")
#    end
#    
#  end
#end


#describe "StaticPages" do
#  describe "GET /static_pages" do
#    it "works! (now write some real specs)" do
#      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
#      get static_pages_index_path
#      response.status.should be(200)
#    end
#  end
#end
