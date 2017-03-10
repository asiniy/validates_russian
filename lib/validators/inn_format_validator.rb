class InnFormatValidator <  ActiveModel::EachValidator
  REGION_NUMBERS = %w{01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 75 41 23 24 59 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 76 77 78 79 83 86 87 89 91 92 99}

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

    unless REGION_NUMBERS.include?(value[0..1])
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
