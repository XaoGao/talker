module Picturable
  extend ActiveSupport::Concern

  included do
    scope :with_picture, -> { includes([picture: { image_attachment: :blob }]) }
    scope :with_pictures, -> { includes([pictures: { image_attachment: :blob }]) }
    scope :with_pictures_for_comments, -> { includes([pictures: { comments: :user}]) }
  end
end
