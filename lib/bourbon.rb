module Bourbon
  # == Description
  # HTML5 compatiable tag helpers. All methods take an +attr+ hash that will be
  # inserted as attributes for the tag. These helpers require an +obj+
  # parameter so that the tags can be scoped properly.
  #
  # Tags are scoped by +obj+ and +field+ (e.g obj[field]). An id attribute is
  # also created for input tags using the format +obj+_+field+.
  module TagHelpers
    # Generates a label tag.
    def label(obj, field, attrs={})
      label_text = attrs.delete(:text) || field
      attrs.merge!(:for => "#{obj}[#{field}]")
      tag('label', attrs, label_text)
    end

    # Generates text input tag.
    def text(obj, field, attrs={})
      attrs.merge!(:type => 'text', :id => "#{obj}_#{field}",
        :name => "#{obj}[#{field}]")

      tag('input', attrs)
    end

    # Generates a submit input tag.
    def submit(attrs={})
      attrs.merge!(:value => 'Submit') unless attrs[:value]
      attrs.merge!(:type => 'submit')
      tag('input', attrs)
    end

    # Generates a textarea input tag.
    def text_area(obj, field, attrs={}, content='')
      attrs.merge!(:id => "#{obj}_#{field}", :name => "#{obj}[#{field}]")
      tag('textarea', attrs, content)
    end

    private

      def tag(name, attributes, content=nil)
        # HTML5 supports a 'required' attribute that does not have a value
        attributes.merge!(:required => nil) if attributes[:required]

        attr_str = attributes.map { |k, v| v ? "#{k}=\"#{v}\"" : k }.join(' ')
        result = "<#{name} #{attr_str}"
        result += content ? ">#{content}</#{name}>" : " />"
      end
  end
end
