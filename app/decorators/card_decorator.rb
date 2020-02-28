class CardDecorator < Draper::Decorator
  delegate_all

  def current_picture
    return unless picture

    h.content_tag :div, class: 'row text-center' do
      h.tag :img, src: picture.url
    end
  end
end
