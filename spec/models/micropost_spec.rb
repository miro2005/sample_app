require 'spec_helper'

describe Micropost do

  before(:each) do
    @attr = {
      :content => "value for content",
      :user_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Micropost.create!(@attr)
  end
end
