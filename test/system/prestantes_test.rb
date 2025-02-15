require "application_system_test_case"

class PrestantesTest < ApplicationSystemTestCase
  setup do
    @prestante = prestantes(:one)
  end

  test "visiting the index" do
    visit prestantes_url
    assert_selector "h1", text: "Prestantes"
  end

  test "should create prestante" do
    visit prestantes_url
    click_on "New prestante"

    fill_in "Categoria", with: @prestante.categoria_id
    fill_in "Nome", with: @prestante.nome
    click_on "Create Prestante"

    assert_text "Prestante was successfully created"
    click_on "Back"
  end

  test "should update Prestante" do
    visit prestante_url(@prestante)
    click_on "Edit this prestante", match: :first

    fill_in "Categoria", with: @prestante.categoria_id
    fill_in "Nome", with: @prestante.nome
    click_on "Update Prestante"

    assert_text "Prestante was successfully updated"
    click_on "Back"
  end

  test "should destroy Prestante" do
    visit prestante_url(@prestante)
    click_on "Destroy this prestante", match: :first

    assert_text "Prestante was successfully destroyed"
  end
end
