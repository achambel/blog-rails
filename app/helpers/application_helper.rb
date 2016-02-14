module ApplicationHelper
  def gravatar_image(email)
    hash = Digest::MD5.hexdigest(email)
    image_tag "//gravatar.com/avatar/#{hash}?d=mm", class: 'ui avatar image', alt: ''
  end
end
