module ApplicationHelper
  include Pagy::Frontend

  # Cool stuff i had to re-use it :)
  def present(model, presenter_class = nil)
    klass = presenter_class || "#{model.class}Presenter".safe_constantize
    presenter = klass.new(model, self)
    yield(presenter) if block_given?
  end
end
