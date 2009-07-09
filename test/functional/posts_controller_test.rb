require File.dirname(__FILE__) + "/../test_helper"

class PostsControllerTest < ActionController::TestCase

  context "PostsController" do

    context "on GET to :index" do
      
      context "with posts" do
        setup do
          Factory(:post)
          get :index
        end

        should_respond_with :success
        should_render_template :index
        should_assign_to :posts
      end # context "with posts"
      
      context "without posts" do
        setup { get :index }
        
        should_respond_with :success
        should_render_template :index
        should_assign_to :posts
        
      end # context "without posts"
    end

    context "on GET to :show" do
      
      setup do
        @post = Factory(:post)
        get :show, :id => @post.id
      end
      
      should_respond_with :success
      should_render_template :show
      should_assign_to :post, :equals => @post
      should_not_set_the_flash

    end
    
  end # context "PostsController"
  
end
