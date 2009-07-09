require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  context "index action" do
    should "render index template" do
      get :index
      assert_template 'index'
    end
  end
  
  context "show action" do
    should "render show template" do
      get :show, :id => Comment.first
      assert_template 'show'
    end
  end
  
  context "new action" do
    should "render new template" do
      get :new
      assert_template 'new'
    end
  end
  
  context "create action" do
    should "render new template when model is invalid" do
      Comment.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'
    end
    
    should "redirect when model is valid" do
      Comment.any_instance.stubs(:valid?).returns(true)
      post :create
      assert_redirected_to comment_url(assigns(:comment))
    end
  end
  
  context "edit action" do
    should "render edit template" do
      get :edit, :id => Comment.first
      assert_template 'edit'
    end
  end
  
  context "update action" do
    should "render edit template when model is invalid" do
      Comment.any_instance.stubs(:valid?).returns(false)
      put :update, :id => Comment.first
      assert_template 'edit'
    end
  
    should "redirect when model is valid" do
      Comment.any_instance.stubs(:valid?).returns(true)
      put :update, :id => Comment.first
      assert_redirected_to comment_url(assigns(:comment))
    end
  end
  
  context "destroy action" do
    should "destroy model and redirect to index action" do
      comment = Comment.first
      delete :destroy, :id => comment
      assert_redirected_to comments_url
      assert !Comment.exists?(comment.id)
    end
  end
end
