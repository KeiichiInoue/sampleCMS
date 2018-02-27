require 'test_helper'

class PushTextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @push_text = push_texts(:one)
  end

  test "should get index" do
    get push_texts_url
    assert_response :success
  end

  test "should get new" do
    get new_push_text_url
    assert_response :success
  end

  test "should create push_text" do
    assert_difference('PushText.count') do
      post push_texts_url, params: { push_text: { detail: @push_text.detail, pushed_at: @push_text.pushed_at, registrant_id: @push_text.registrant_id } }
    end

    assert_redirected_to push_text_url(PushText.last)
  end

  test "should show push_text" do
    get push_text_url(@push_text)
    assert_response :success
  end

  test "should get edit" do
    get edit_push_text_url(@push_text)
    assert_response :success
  end

  test "should update push_text" do
    patch push_text_url(@push_text), params: { push_text: { detail: @push_text.detail, pushed_at: @push_text.pushed_at, registrant_id: @push_text.registrant_id } }
    assert_redirected_to push_text_url(@push_text)
  end

  test "should destroy push_text" do
    assert_difference('PushText.count', -1) do
      delete push_text_url(@push_text)
    end

    assert_redirected_to push_texts_url
  end
end
