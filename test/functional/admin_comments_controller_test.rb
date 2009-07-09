require File.dirname(__FILE__) + "/../test_helper"

class Admin::CommentsControllerTest < ActionController::TestCase
  context "Admin::Comments" do
    setup do
      Factory(:comment)
    end

    context "on GET to :index" do
      should "render index template" do
        get :index
        assert_template 'index'
      end
    end

    context "on GET to :show" do
      should "render show template" do
        get :show, :id => Comment.first
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
        Comment.any_instance.stubs(:valid?).returns(false)
        post :create
        assert_template 'new'
      end

      should "redirect when model is valid" do
        Comment.any_instance.stubs(:valid?).returns(true)
        post :create
        assert_redirected_to admin_comment_url(assigns(:comment))
      end
    end

    context "on GET to :edit" do
      should "render edit template" do
        get :edit, :id => Comment.first
        assert_template 'edit'
      end
    end

    context "on PUT to :update" do
      should "render edit template when model is invalid" do
        Comment.any_instance.stubs(:valid?).returns(false)
        put :update, :id => Comment.first
        assert_template 'edit'
      end

      should "redirect when model is valid" do
        Comment.any_instance.stubs(:valid?).returns(true)
        put :update, :id => Comment.first
        assert_redirected_to admin_comment_url(assigns(:comment))
      end
    end

    context "on DELETE to :destroy" do
      should "destroy model and redirect to index action" do
        comment = Comment.first
        delete :destroy, :id => comment
        assert_redirected_to admin_comments_url
        assert !Comment.exists?(comment.id)
      end
    end
    
  end # context "Admin::Comments"
  
end
