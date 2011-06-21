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
end
