# == Description
module Bourbon
  # Generates a label tag. The 'for' attribute of the tag is scoped to the
  # given +obj+ and +field+.
  #
  # Options::
  #   :text::
  #     Custom label text. Defaults to the field name if not given.
  def label(obj, field, options={})
    label_text = options.delete(:text) || field
    "<label for=\"#{obj}[#{field}]\">#{label_text}</label>"
  end

  # Generates an input tag of type 'text'.The id attribute is set to the
  # underscored combination of +obj+ and +field+. The name attribute is scoped
  # to +obj+ and +field+.
  #
  # options::
  #   :required:: true | false
  #     If true, inserts an HTML5 'required' attribute.
  def text(obj, field, options={})
    required = options.delete(:required) ? 'required ' : ''
    "<input type=\"text\" id=\"#{obj}_#{field}\" name=\"#{obj}[#{field}]\" #{required}/>"
  end
end
