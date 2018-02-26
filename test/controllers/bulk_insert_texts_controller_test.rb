require 'test_helper'

class BulkInsertTextsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bulk_insert_texts_index_url
    assert_response :success
  end

end
