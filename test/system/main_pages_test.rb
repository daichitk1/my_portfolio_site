require "application_system_test_case"

class MainPagesTest < ApplicationSystemTestCase
  test "visiting the root shows the personal profile and social links" do
    visit root_url
    assert_selector "h1", text: "Daichi Takei"
    assert_selector 'a[href="https://github.com/daichitk1"]'
    assert_selector 'a[href="https://x.com/CqbsAuCgYY51036"]'
  end

  test "index navigation leads to the skills section" do
    visit main_pages_url
    assert_selector "h1", text: "Daichi Takei"
    click_button "メニュー"
    click_link "情報系スキル"
    assert_current_path(main_pages_path) { |uri| uri.fragment == "information_skill" }
    assert_selector "#information_skill", text: "情報系スキル"
  end
end
