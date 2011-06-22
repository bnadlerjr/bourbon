require 'test_helper'

class TestCheckboxHelper < Test::Unit::TestCase
  include Bourbon::TagHelpers

  def test_basic_checkbox
    expected = '<input type="checkbox" id="obj_item" name="obj[item]" />'
    actual = checkbox :obj, :item

    assert_equal expected, actual
  end
end
