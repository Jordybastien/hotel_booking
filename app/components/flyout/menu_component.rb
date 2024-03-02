# frozen_string_literal: true
class Flyout::MenuComponent < ViewComponent::Base
  renders_one :toggle

  renders_one :menu_content

  def content_wrapper_options
    {
      class: "block relative",
      data: { controller: "flyout-menu" }
    }
  end

  def toggle_btn_wrapper_options
    {
      data: { action:"flyout-menu#toogleMenu" },
      type: "button"
    }
  end

  def menu_wrapper_options
    {
      class: "hidden absolute shadow-xl p-4 rounded-md border border-gray-50 w-fit bg-white z-50 mt-4",
      data: {
        action: "keyup@window->flyout-menu#closeWithKeyboard click@window->flyout-menu#closeBackground", 
        flyout_menu_target: "menu"
      }
    }
  end
end