# frozen_string_literal: true
module ApplicationHelper
  def render_flash
    flash.each do |type, messages|
      Array.wrap(messages).each do |message|
        concat content_tag(:span, message, class: "label #{foundation_flash_class(type)}")
      end
    end
  end

  private

  def foundation_flash_class(type)
    case type.to_sym
    when :alert
      :alert
    when :notice
      :primary
    else
      :primary
    end
  end
end
