require File.dirname(__FILE__) + "/../test_helper"

class Admin::PostsControllerTest < ActionController::TestCase
  context "PostsController" do
    setup do
      Factory(:post)
    end

    context "on GET to :index" do
      should "render index template" do
        get :index
        assert_template 'index'
      end
    end

    context "on GET to :show" do
      should "render show template" do
        get :show, :id => Post.first
        assert_template 'show'
      end
    end

    context "on GET to :new" do
      should "render new template" do
        get :new
        assert_template 'new'
      end
    end

    context "on POST to :create" do
      should "render new template when model is invalid" do
        Post.any_instance.stubs(:valid?).returns(false)
        post :create
        assert_template 'new'
      end

      should "redirect when model is valid" do
        Post.any_instance.stubs(:valid?).returns(true)
        post :create
        assert_redirected_to admin_post_url(assigns(:post))
      end
    end

    context "on GET to :edit" do
      should "render edit template" do
        get :edit, :id => Post.first
        assert_template 'edit'
      end
    end

    context "on PUT to :update" do
      should "render edit template when model is invalid" do
        Post.any_instance.stubs(:valid?).returns(false)
        put :update, :id => Post.first
        assert_template 'edit'
      end

      should "redirect when model is valid" do
        Post.any_instance.stubs(:valid?).returns(true)
        put :update, :id => Post.first
        assert_redirected_to admin_post_url(assigns(:post))
      end
    end

    context "on DELETE to :destroy" do
      should "destroy model and redirect to index action" do
        post = Post.first
        delete :destroy, :id => post
        assert_redirected_to admin_posts_url
        assert !Post.exists?(post.id)
      end
    end
    
  end # context "PostsController"
  
end
