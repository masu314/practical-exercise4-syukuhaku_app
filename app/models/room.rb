class Room < ApplicationRecord
    mount_uploader :room_image, RoomImageUploader
    belongs_to :user
    has_many :reservations ,dependent: :destroy

    with_options presence: true do
        validates :room_name
        validates :room_introduction
        validates :room_price
        validates :room_address
    end

    # 料金が1円以上となるようにする
    validates :room_price, numericality: { only_integer: true, greater_than_or_equal_to: 1}
end
