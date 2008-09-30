module Celerity

  class TableCell < Element
    include Celerity::Exception
    include Container

    TAGS = [ Identifier.new('td') ]
    ATTRIBUTES = BASE_ATTRIBUTES | CELLHALIGN_ATTRIBUTES | 
                 CELLVALIGN_ATTRIBUTES | [:abbr, :axis, :headers, :scope, :rowspan, :colspan]

    DEFAULT_HOW = :id

    alias_method :to_s, :text

    def colspan
      assert_exists
      attribute_value = @object.getAttributeValue('colspan').to_i
      attribute_value > 0 ? attribute_value : 1
    end

  end
end