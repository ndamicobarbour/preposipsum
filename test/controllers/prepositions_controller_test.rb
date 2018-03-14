require 'test_helper'

class PrepositionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @preposition = prepositions(:one)
  end

  test "should get index" do
    get prepositions_url
    assert_response :success
  end

  test "should get new" do
    get new_preposition_url
    assert_response :success
  end

  test "should create preposition" do
    assert_difference('Preposition.count') do
      post prepositions_url, params: { preposition: { p: @preposition.p } }
    end

    assert_redirected_to preposition_url(Preposition.last)
  end

  test "should show preposition" do
    get preposition_url(@preposition)
    assert_response :success
  end

  test "should get edit" do
    get edit_preposition_url(@preposition)
    assert_response :success
  end

  test "should update preposition" do
    patch preposition_url(@preposition), params: { preposition: { p: @preposition.p } }
    assert_redirected_to preposition_url(@preposition)
  end

  test "should destroy preposition" do
    assert_difference('Preposition.count', -1) do
      delete preposition_url(@preposition)
    end

    assert_redirected_to prepositions_url
  end
end
