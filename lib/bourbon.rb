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
      attrs.merge!(:for => id_for(obj, field)) if obj && field
      tag('label', attrs, label_text)
    end

    # Generates text input tag.
    def text(obj, field, attrs={})
      attrs.merge!(:type => 'text', :id => id_for(obj, field),
        :name => name_for(obj, field))

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
      attrs.merge!(:id => id_for(obj, field), :name => name_for(obj, field))
      tag('textarea', attrs, content)
    end

    # Generates a checkbox input tag.
    def checkbox(obj, field, attrs={})
      attrs.merge!(:type => 'checkbox', :id => id_for(obj, field),
        :name => name_for(obj, field))

      tag('input', attrs)
    end

    # Generates a radio button
    def radio(obj, field, attrs={}, label=nil)
      attrs.merge!(:type => 'radio', :id => id_for(obj, field),
        :name => name_for(obj, field))

      tag('input', attrs, label)
    end

    # Generates a select tag. Also generates option tags using +collection+.
    def select(obj, field, collection, attrs={})
      opt_tags = collection.map { |k, v| tag('option', { :value => k}, v) }
      attrs.merge!(:id => id_for(obj, field), :name => name_for(obj, field))
      tag('select', attrs, opt_tags.join(''))
    end

    private

      def tag(name, attributes, content=nil)
        # HTML5 supports a 'required' attribute that does not have a value
        attributes.merge!(:required => nil) if attributes[:required]

        attr_str = attributes.map { |k, v| v ? "#{k}=\"#{v}\"" : k }.join(' ')
        result = '' == attr_str ? "<#{name}" : "<#{name} #{attr_str}"
        result += content ? ">#{content}</#{name}>" : " />"
      end

      def id_for(obj, field)
        obj = [obj] unless obj.is_a?(Array)
        obj.join('_') + "_#{field}"
      end

      def name_for(obj, field)
        obj = [obj] unless obj.is_a?(Array)
        len = obj.length
        obj[0].to_s + obj[1..len].map { |o| "[#{o}]" }.join('') + "[#{field}]"
      end
  end
end
