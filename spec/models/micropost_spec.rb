require 'spec_helper'

describe Micropost do
  pending "add some examples to (or delete) #{__FILE__}"
  let (:user) { FactoryGirl.create(:user) }
  before { @micropost = user.microposts.build(content: "Hello World")}
  subject { @micropost }
  it { should respond_to(:content)}
  it { should respond_to(:user_id)}
  it { should respond_to(:user)}
  its (:user) { should eq user }

  it { should be_valid }

  describe "when user_id is not present" do
  	before { @micropost.user_id = nil }
  	it { should_not be_valid }
  end

  describe "blank content" do
  	before { @micropost.content = "a" * 141 }
  	it { should_not be_valid }
  end
end
