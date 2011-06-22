require 'test_helper'

class TestSubmitHelper < Test::Unit::TestCase
  include Bourbon

  def test_basic_submit_tag
    expected = '<input value="Submit" type="submit" />'
    actual = submit

    assert_equal expected, actual
  end

  def test_submit_tag_with_custom_button_text
    expected = '<input value="Go!" type="submit" />'
    actual = submit :value => 'Go!'

    assert_equal expected, actual
  end
end
