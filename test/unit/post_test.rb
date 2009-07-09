require File.dirname(__FILE__) + "/../test_helper"

class PostTest < ActiveSupport::TestCase
  context "A Post model" do
    should_validate_presence_of :title, :body
    should_have_many :comments, :dependent => :destroy
  end # context "A Post model"
  
end
