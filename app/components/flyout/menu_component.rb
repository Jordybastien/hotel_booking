# frozen_string_literal: true

require 'view_component/base'

class Flyout::MenuComponent < ViewComponent::Base
  renders_one :menu_content

  renders_one :toggle, -> do
    button_tag type: "button", data: { controller: "flyout" }, class: "relative focus:outline-none"
  end

  def initialize
    @toggle_open = false
  end

#   def render
#     button_tag type: "button", data: { controller: "flyout" }, class: "relative focus:outline-none", &method(:render_toggle) +
#       div(class: "absolute top-0 left-0 w-full h-full bg-gray-900/50 opacity-0 transition-all duration-150 ease-in-out pointer-events-none z-50",
#            data: { controller: "flyout", target: "flyout" },
#            &method(:render_content))
#   end

#   private

#   def render_toggle
#     toggle
#   end

#   def render_content
#     return unless @toggle_open

#     div(class: "absolute top-full left-0 right-0 z-50 bg-white shadow-md rounded-lg overflow-hidden", &method(:content))
#   end
end
