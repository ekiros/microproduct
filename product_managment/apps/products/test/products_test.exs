defmodule ProductsTest do
  use ExUnit.Case

  alias Product.Basic.BL
  #doctest Products

  test "set properties and assert they are not nil" do
    assert BL.set_product_default_properties != nil
  end

  test "get properties from an empty struct" do
    assert is_nil(BL.get_product_name(%{}))
  end

  test "get product property for the :product_name key" do
      assert BL.get_product_name(BL.set_default_properties) == "Zumv"
  end

  test "get product property for the :description" do
      assert BL.get_description(BL.set_default_properties) == "What a world and what has been"
  end

  test "get product primary benefit" do
    assert BL.get_primary_benefit(BL.set_default_properties) == "Good work"
  end

  test "updating product name to GUMBO" do
    mod = BL.set_default_properties
    assert BL.get_product_name(BL.update_product_name(mod, "GUMBO")) == "GUMBO"
  end

  test "just print this product" do
    assert BL.print_product(BL.set_default_properties) != nil
  end
end
