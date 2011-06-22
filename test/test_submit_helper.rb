require 'test_helper'

class TestSubmitHelper < Test::Unit::TestCase
  include Bourbon

  def test_basic_submit_tag
    expected = '<input type="submit" value="Submit" />'
    actual = submit

    assert_equal expected, actual
  end

  def test_submit_tag_with_custom_button_text
    expected = '<input type="submit" value="Go!" />'
    actual = submit :text => 'Go!'

    assert_equal expected, actual
  end
end
