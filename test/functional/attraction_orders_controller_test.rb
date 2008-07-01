require File.dirname(__FILE__) + '/../test_helper'
require 'attraction_orders_controller'

# Re-raise errors caught by the controller.
class AttractionOrdersController; def rescue_action(e) raise e end; end

class AttractionOrdersControllerTest < Test::Unit::TestCase
  fixtures :attraction_orders

  def setup
    @controller = AttractionOrdersController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = attraction_orders(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:attraction_orders)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:attraction_order)
    assert assigns(:attraction_order).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:attraction_order)
  end

  def test_create
    num_attraction_orders = AttractionOrder.count

    post :create, :attraction_order => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_attraction_orders + 1, AttractionOrder.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:attraction_order)
    assert assigns(:attraction_order).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      AttractionOrder.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      AttractionOrder.find(@first_id)
    }
  end
end
