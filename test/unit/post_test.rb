require File.dirname(__FILE__) + "/../test_helper"

class PostTest < ActiveSupport::TestCase
  should "be valid" do
    assert Post.new.valid?
  end
end
