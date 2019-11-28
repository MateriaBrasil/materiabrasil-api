# frozen_string_literal: true

module PolymorphicFind
  include ActiveSupport::Concern
  def polymorphic_find(association)
    if association == 'commentable'
      [Material, Topic].find do |type|
        type.name == params["#{association}_type"]
      end.find(params["#{association}_id"])
    else
      [Material, Topic].find do |type|
        type.name == params["#{association}_type"]
      end.friendly.find(params["#{association}_id"])
    end
  end
end
