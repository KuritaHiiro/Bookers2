class PostImage < ApplicationRecord
    has_one_attached :profile_image
    belongs_to :user
end
