# frozen_string_literal: true

class Alert::Banner < ViewComponent::Base

  def initialize(type:, title: nil, body: nil)
    validate_type = %i[warning error success info]
    raise "alert type is either one of these: warning, error, success, info" unless validate_type.include? type

    @body = body
    @type = type
    @title = title
    @options = set_options
  end

  def set_options
    case @type
    when :success
      { icon: "success_circle.svg", container_style: "bg-green-50 border-green-300", title_style: "text-green-800" }
    when :info
      { icon: "info_circle.svg", container_style: "bg-indigo-50 border-indigo-300", title_style: "text-indigo-800" }
    when :warning
      { icon: "warning_circle.svg", container_style: "bg-yellow-50 border-yellow-300", title_style: "text-yellow-800" }
    when :error
      { icon: "error_circle.svg", container_style: "bg-red-50 border-red-300", title_style: "text-red-800" }
    end
  end

  def icon
    @options[:icon]
  end

  def container_style
    @options[:container_style]
  end

  def title_style
    @options[:title_style]
  end

  def message
    case @body
    when Array
      formatted_body = @body.map { |line| "• #{line}" }.join("\n")
      helpers.simple_format(formatted_body)
    else
      @body
    end
  end
end
