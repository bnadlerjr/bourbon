require 'test_helper'

class TestTextHelper < Test::Unit::TestCase
  include Bourbon

  def test_basic_text_field
    expected = '<input type="text" id="obj_item" name="obj[item]" />'
    actual = text :obj, :item

    assert_equal expected, actual
  end

  def test_required_text_field
    expected = '<input type="text" id="obj_item" name="obj[item]" required />'
    actual = text :obj, :item, :required => true

    assert_equal expected, actual
  end
end
