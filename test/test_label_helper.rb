require 'test_helper'

class TestLabelHelper < Test::Unit::TestCase
  include Bourbon

  def test_plain_label
    expected = '<label for="obj[item]">item</label>'
    actual = label :obj, :item

    assert_equal expected, actual
  end
end
