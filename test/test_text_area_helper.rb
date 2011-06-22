require 'test_helper'

class TestTextAreaHelper < Test::Unit::TestCase
  include Bourbon::TagHelpers

  def test_basic_text_area
    expected = '<textarea id="obj_item" name="obj[item]"></textarea>'
    actual = text_area :obj, :item

    assert_equal expected, actual
  end
end
