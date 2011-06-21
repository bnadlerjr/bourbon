require 'test_helper'

class TestLabelHelper < Test::Unit::TestCase
  include Bourbon

  def test_label_text_uses_field_if_not_given
    expected = '<label for="obj[item]">item</label>'
    actual = label :obj, :item

    assert_equal expected, actual
  end

  def test_label_with_custom_text
    expected = '<label for="obj[item]">My Label</label>'
    actual = label :obj, :item, :text => 'My Label'

    assert_equal expected, actual
  end
end
