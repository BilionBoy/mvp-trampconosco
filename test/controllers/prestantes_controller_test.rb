require "test_helper"

class PrestantesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @prestante = prestantes(:one)
  end

  test "should get index" do
    get prestantes_url
    assert_response :success
  end

  test "should get new" do
    get new_prestante_url
    assert_response :success
  end

  test "should create prestante" do
    assert_difference("Prestante.count") do
      post prestantes_url, params: { prestante: { categoria_id: @prestante.categoria_id, nome: @prestante.nome } }
    end

    assert_redirected_to prestante_url(Prestante.last)
  end

  test "should show prestante" do
    get prestante_url(@prestante)
    assert_response :success
  end

  test "should get edit" do
    get edit_prestante_url(@prestante)
    assert_response :success
  end

  test "should update prestante" do
    patch prestante_url(@prestante), params: { prestante: { categoria_id: @prestante.categoria_id, nome: @prestante.nome } }
    assert_redirected_to prestante_url(@prestante)
  end

  test "should destroy prestante" do
    assert_difference("Prestante.count", -1) do
      delete prestante_url(@prestante)
    end

    assert_redirected_to prestantes_url
  end
end
