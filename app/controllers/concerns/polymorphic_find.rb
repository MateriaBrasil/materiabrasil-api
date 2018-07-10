# frozen_string_literal: true

module PolymorphicFind
  include ActiveSupport::Concern

  def polymorphic_find(association)
    [Material].find do |type|
      type.name == params["#{association}_type"]
    end.find(params["#{association}_id"])
  end
end
