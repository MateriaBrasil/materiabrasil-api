# frozen_string_literal: true

class BigDecimal
  def as_json(*)
    to_f
  end
end
