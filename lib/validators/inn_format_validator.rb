class InnFormatValidator <  ActiveModel::EachValidator

  # Причина постановки на учет
  P10 = [2, 4, 10, 3, 5, 9, 4, 6, 8]
  P11 = [7, 2, 4, 10, 3, 5, 9, 4, 6, 8]
  P12 = [3, 7, 2, 4, 10, 3, 5, 9, 4, 6, 8]

  def validate_each(record, attribute, value)
    res = true
    value = value.to_s
    unless value =~ /^\d+$/
      error record, attribute, value, :numbers_only
      res = false
    end

    if value.length != 10 and value.length != 12
      error record, attribute, value, :invalid_length
      res = false
    end

    unless ValidatesRussian::REGION_NUMBERS.include?(value[0..1])
      error record, attribute, value, :unknown_region
      res = false
    end

    return res if options[:mild]

    value = value.split(//).map(&:to_i)

    case value.size
    when 10 then
      unless calc(P10, value) == value[9]
        error record, attribute, value, :invalid_pp
        res = false
      end
    when 12 then
      unless calc(P11, value) == value[10] && calc(P12, value) == value[11]
        error record, attribute, value, :invalid_pp
        res = false
      end
    end

    res
  end

  private

  def error(record, attribute, value, key)
    record.errors.add(attribute, key, options.merge(value: value))
  end

  def calc(p, value)
    p.each_with_index.inject(0){ |s, p| s + p[0] * value[p[1]] } % 11 % 10
  end
end
