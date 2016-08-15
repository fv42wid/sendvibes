require 'test_helper'

class ChargesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @charge = charges(:one)
  end

  test "should get index" do
    get charges_url
    assert_response :success
  end

  test "should get new" do
    get new_charge_url
    assert_response :success
  end

  test "should create charge" do
    assert_difference('Charge.count') do
      post charges_url, params: { charge: { amount: @charge.amount, card_exp_month: @charge.card_exp_month, card_exp_year: @charge.card_exp_year, card_last_4: @charge.card_last_4, card_type: @charge.card_type, chargeable_id: @charge.chargeable_id, chargeable_type: @charge.chargeable_type, currency: @charge.currency, description: @charge.description, stripe_charge_id: @charge.stripe_charge_id, user_id: @charge.user_id } }
    end

    assert_redirected_to charge_url(Charge.last)
  end

  test "should show charge" do
    get charge_url(@charge)
    assert_response :success
  end

  test "should get edit" do
    get edit_charge_url(@charge)
    assert_response :success
  end

  test "should update charge" do
    patch charge_url(@charge), params: { charge: { amount: @charge.amount, card_exp_month: @charge.card_exp_month, card_exp_year: @charge.card_exp_year, card_last_4: @charge.card_last_4, card_type: @charge.card_type, chargeable_id: @charge.chargeable_id, chargeable_type: @charge.chargeable_type, currency: @charge.currency, description: @charge.description, stripe_charge_id: @charge.stripe_charge_id, user_id: @charge.user_id } }
    assert_redirected_to charge_url(@charge)
  end

  test "should destroy charge" do
    assert_difference('Charge.count', -1) do
      delete charge_url(@charge)
    end

    assert_redirected_to charges_url
  end
end
