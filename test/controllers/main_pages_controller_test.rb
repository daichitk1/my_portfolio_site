require "test_helper"

class MainPagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @main_page = main_pages(:one)
  end

  test "root renders the personal portfolio" do
    get root_url
    assert_response :success
    assert_select "h1", text: "Daichi Takei"
    assert_select 'a[href="https://github.com/daichitk1"]'
    assert_select 'a[href="https://x.com/CqbsAuCgYY51036"]'
  end

  test "index renders the same profile and section navigation" do
    get main_pages_url
    assert_response :success
    assert_select "h1", text: "Daichi Takei"
    assert_select 'a[href="#information_skill"]'
    assert_select "#information_skill"
  end

  # CRUD actions and views were intentionally removed in a8e0300. Keep their
  # existing 404 behavior covered without restoring a public editing interface.
  test "removed read actions return not found" do
    [ new_main_page_url, main_page_url(@main_page), edit_main_page_url(@main_page) ].each do |url|
      get url
      assert_response :not_found
    end
  end

  test "removed create action does not insert records" do
    assert_no_difference("MainPage.count") do
      post main_pages_url, params: { main_page: { title: "Unexpected", body: "Write" } }
    end
    assert_response :not_found
  end

  test "removed update action does not change records" do
    original = @main_page.attributes
    patch main_page_url(@main_page), params: { main_page: { title: "Unexpected" } }
    assert_response :not_found
    assert_equal original, @main_page.reload.attributes
  end

  test "removed destroy action does not delete records" do
    assert_no_difference("MainPage.count") { delete main_page_url(@main_page) }
    assert_response :not_found
  end

  test "health endpoint remains available" do
    get rails_health_check_url
    assert_response :success
  end
end
