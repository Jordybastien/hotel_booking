class HotelPresenter < BasePresenter
  def description
    helpers.content_tag(:div, class: 'flex flex-row gap-x-1') do
      helpers.content_tag(:span, "#{name},") +
        helpers.content_tag(:span, city)
    end
  end

  def formatted_price
    "$ #{price} night"
  end
end
