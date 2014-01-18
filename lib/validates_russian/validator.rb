module ValidatesRussian
  class Validator < ActiveModel::EachValidator
    def self.validates_using(&block)
      define_method :validate_each do |record, attribute, value|
        if block[value.to_s] == false
          record.errors.add(attribute, attribute.to_sym, options.merge(value: value))
        end
      end
    end
  end
end
