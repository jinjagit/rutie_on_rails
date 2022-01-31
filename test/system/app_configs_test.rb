require "application_system_test_case"

class AppConfigsTest < ApplicationSystemTestCase
  setup do
    @app_config = app_configs(:one)
  end

  test "visiting the index" do
    visit app_configs_url
    assert_selector "h1", text: "App Configs"
  end

  test "creating a App config" do
    visit app_configs_url
    click_on "New App Config"

    check "Rust enabled" if @app_config.rust_enabled
    click_on "Create App config"

    assert_text "App config was successfully created"
    click_on "Back"
  end

  test "updating a App config" do
    visit app_configs_url
    click_on "Edit", match: :first

    check "Rust enabled" if @app_config.rust_enabled
    click_on "Update App config"

    assert_text "App config was successfully updated"
    click_on "Back"
  end

  test "destroying a App config" do
    visit app_configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "App config was successfully destroyed"
  end
end
