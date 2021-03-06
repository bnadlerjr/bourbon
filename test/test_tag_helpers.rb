require 'test_helper'

class TestTagHelpers < Test::Unit::TestCase
  include Bourbon::TagHelpers

  def test_basic_checkbox
    expected = '<input type="checkbox" id="obj_item" name="obj[item]" />'
    actual = checkbox :obj, :item

    assert_equal expected, actual
  end

  def test_checkbox_with_nested_obj
    expected = '<input type="checkbox" id="obj_sub_item" ' +
      'name="obj[sub][item]" />'

    actual = checkbox [:obj, :sub], :item

    assert_equal expected, actual
  end

  def test_label_text_uses_field_if_not_given
    expected = '<label for="obj_item">item</label>'
    actual = label :obj, :item

    assert_equal expected, actual
  end

  def test_label_with_custom_text
    expected = '<label for="obj_item">My Label</label>'
    actual = label :obj, :item, :text => 'My Label'

    assert_equal expected, actual
  end

  def test_label_skips_for_if_nil
    expected = '<label>My Label</label>'
    actual = label nil, nil, :text => 'My Label'

    assert_equal expected, actual
  end

  def test_label_with_nested_object
    expected = '<label for="obj_sub_item">My Label</label>'
    actual = label [:obj, :sub], :item, :text => 'My Label'

    assert_equal expected, actual
  end

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

  def test_basic_text_area
    expected = '<textarea id="obj_item" name="obj[item]"></textarea>'
    actual = text_area :obj, :item

    assert_equal expected, actual
  end

  def test_text_area_with_nested_obj
    expected = '<textarea id="obj_sub_item" name="obj[sub][item]"></textarea>'
    actual = text_area [:obj, :sub], :item

    assert_equal expected, actual
  end

  def test_basic_text_field
    expected = '<input type="text" id="obj_item" name="obj[item]" />'
    actual = text :obj, :item

    assert_equal expected, actual
  end

  def test_text_field_with_nested_obj
    expected = '<input type="text" id="obj_sub_item" name="obj[sub][item]" />'
    actual = text [:obj, :sub], :item

    assert_equal expected, actual
  end

  def test_required_text_field
    expected = '<input required type="text" id="obj_item" name="obj[item]" />'
    actual = text :obj, :item, :required => true

    assert_equal expected, actual
  end

  def test_basic_radio_field
    expected = '<input value="yes" type="radio" id="obj_item" ' +
      'name="obj[item]" />'

    actual = radio :obj, :item, :value => 'yes'

    assert_equal expected, actual
  end

  def test_readio_field_with_nested_obj
    expected = '<input value="yes" type="radio" id="obj_sub_item" ' +
      'name="obj[sub][item]" />'

    actual = radio [:obj, :sub], :item, :value => 'yes'

    assert_equal expected, actual
  end

  def test_basic_select_field
    expected = [
      '<select id="obj_item" name="obj[item]">',
      '<option value="1">One</option>',
      '<option value="2">Two</option>',
      '<option value="3">Three</option>',
      '</select>'].join('')

    actual = select :obj, :item, { 1 => 'One', 2 => 'Two', 3 => 'Three' }

    assert_equal expected, actual
  end

  def test_select_field_with_nested_obj
    expected = [
      '<select id="obj_sub_item" name="obj[sub][item]">',
      '<option value="1">One</option>',
      '<option value="2">Two</option>',
      '<option value="3">Three</option>',
      '</select>'].join('')

    actual = select [:obj, :sub], :item,
      { 1 => 'One', 2 => 'Two', 3 => 'Three' }

    assert_equal expected, actual
  end

  def test_using_two_radio_objects_does_not_overwrite_obj
    expected1 = '<input value="yes" type="radio" id="obj_item1" ' +
      'name="obj[item1]" />'

    expected2 = '<input value="yes" type="radio" id="obj_item2" ' +
      'name="obj[item2]" />'

    actual1 = radio :obj, :item1, :value => 'yes'
    actual2 = radio :obj, :item2, :value => 'yes'

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end

  def test_using_two_nested_radio_objects_does_not_overwrite_obj
    expected1 = '<input value="yes" type="radio" id="obj_sub_item1" ' +
      'name="obj[sub][item1]" />'

    expected2 = '<input value="yes" type="radio" id="obj_sub_item2" ' +
      'name="obj[sub][item2]" />'

    actual1 = radio [:obj, :sub], :item1, :value => 'yes'
    actual2 = radio [:obj, :sub], :item2, :value => 'yes'

    assert_equal expected1, actual1
    assert_equal expected2, actual2
  end
end
