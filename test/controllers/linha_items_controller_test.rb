require 'test_helper'

class LinhaItemsControllerTest < ActionController::TestCase
  setup do
    @linha_item = linha_items(:one)
  end

  test "should create line_item" do
     assert_difference('LinhaItem.count') do
        post :create, product_id: products(:ruby).id
     end
     
     assert_redirected_to cart_path(assigns(:linha_item).carrinho) 
  end


  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:linha_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create linha_item" do
    assert_difference('LinhaItem.count') do
      post :create, linha_item: { carrinho_id: @linha_item.carrinho_id, product_id: @linha_item.product_id }
    end

    assert_redirected_to linha_item_path(assigns(:linha_item))
  end

  test "should show linha_item" do
    get :show, id: @linha_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @linha_item
    assert_response :success
  end

	test "should update linha_item" do
#		patch :update, id: @linha_item, linha_item: { carrinho_id: @linha_item.carrinho_id, product_id: @linha_item.product_id }
		patch :update, id: @line_item, line_item: { product_id: @linha_item.product_id }
		assert_redirected_to linha_item_path(assigns(:linha_item))
	end

  test "should destroy linha_item" do
    assert_difference('LinhaItem.count', -1) do
      delete :destroy, id: @linha_item
    end
    assert_redirected_to linha_items_path
  end
end