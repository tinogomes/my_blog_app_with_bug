require File.dirname(__FILE__) + "/../test_helper"

class CommentTest < ActiveSupport::TestCase
  context "A Comment model" do
    should_belong_to :post
  end # context "A Comment model"
end
