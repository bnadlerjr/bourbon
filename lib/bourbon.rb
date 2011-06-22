# == Description
module Bourbon
  # Generates a label tag. The 'for' attribute of the tag is scoped to the
  # given +obj+ and +field+.
  #
  # options::
  #   :text::
  #     Custom label text. Defaults to the field name if not given.
  def label(obj, field, options={})
    label_text = options.delete(:text) || field
    options.merge!(:for => "#{obj}[#{field}]")
    tag('label', options, label_text)
  end

  # Generates an input tag of type 'text'.The id attribute is set to the
  # underscored combination of +obj+ and +field+. The name attribute is scoped
  # to +obj+ and +field+.
  #
  # options::
  #   :required:: true | false
  #     If true, inserts an HTML5 'required' attribute.
  def text(obj, field, options={})
    options.merge!(:type => 'text', :id => "#{obj}_#{field}",
      :name => "#{obj}[#{field}]")

    tag('input', options)
  end

  # Generate a submit input tag.
  #
  # options::
  #   :value::
  #     The button text; defaults to 'Submit'.
  def submit(options={})
    options.merge!(:value => 'Submit') unless options[:value]
    options.merge!(:type => 'submit')
    tag('input', options)
  end

  # Generates a textarea input tag.
  def text_area(obj, field, options={}, content='')
    options.merge!(:id => "#{obj}_#{field}", :name => "#{obj}[#{field}]")
    tag('textarea', options, content)
  end

  private

    def tag(name, attributes, content=nil)
      attributes.merge!(:required => nil) if attributes[:required]
      attr_str = attributes.map { |k, v| v ? "#{k}=\"#{v}\"" : k }.join(' ')
      result = "<#{name} #{attr_str}"
      result += content ? ">#{content}</#{name}>" : " />"
    end
end
