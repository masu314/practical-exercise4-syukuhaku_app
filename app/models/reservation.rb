class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :room
    with_options presence: true do
        validates :check_in_date
        validates :check_out_date
        validates :user_num
    end

    #人数が1人以上となるようにする
    validates :user_num, numericality: { only_integer: true, greater_than_or_equal_to: 1}

    validate :check_in_date_cannot_be_in_the_past,
    :check_out_date_cannot_be_before_check_in_date

    #チェックイン日が本日以降の日付となるようにする 
    def check_in_date_cannot_be_in_the_past
        if check_in_date.present? && check_in_date <= Date.today
          errors.add(:check_in_date, "に過去の日付は使えません")
        end
    end

    #チェックアウト日がチェックイン日より後の日付となるようにする
    def check_out_date_cannot_be_before_check_in_date
        if check_out_date.present? && check_in_date.present? && check_out_date <= check_in_date
          errors.add(:check_out_date, "がチェックイン日より後になっていません")
        end
    end


end
