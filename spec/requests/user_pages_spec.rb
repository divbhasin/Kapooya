require 'spec_helper'

describe "UserPages" do
	subject { page }
  describe "GET /user_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get user_pages_index_path
      response.status.should be(200)
    end

    describe "Sign Up page" do
    	before { visit signup_path }
    	let(:submit) { "Create my account" }
      describe "with invalid information" do
        it "should not create a user" do
          expect { click_button submit }.not_to change(User, :count)
        end
    end
    describe "with valid information" do
      before do
        fill_in "Name",       with: "Example User"
        fill_in "Email",      with: "user@example.com"
        fill_in "Password",   with: "foobar"
        fill_in "Confirmation" with: "foobar"
      end
      it "should create a user" do
        expect { click_button submit }. to change(User, :count).by(1)
      end
   end

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user)}
    before { visit user_path(user)}
    let! (:m1) { FactoryGirl.create(:micropost, user: user, content: "Hello")}
    let! (:m2) { FactoryGirl.create(:micropost, user: user, content: "World")}
    it { should have_selector 'h1', text: user.name }
    it { should have_selector 'title', text: user.email }
    describe "microposts" do 
      it { should have_content (m1.content)}
      it { should have_content (m2.content)}
      it { should have_content (user.microposts.count)}
     end
  end

   describe "after saving the user" do
    it { should have_link "Sign Out" }
  end

  describe "followed by signout" do
    before { click_link "Sign Out" }
    it { should have_link "Sign In" }
    end 
end
