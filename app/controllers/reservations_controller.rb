class ReservationsController < ApplicationController
  # 予約一覧ページ
  def index
    @user = current_user
    @reservations = @user.reservations

  end

  # 予約確認ページ
  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date,:check_out_date,:user_num, :room_id))
    @reservation.user_id = current_user.id
    unless @reservation.save
      @room = Room.find(@reservation.room_id)
      render "rooms/show"
    end
  end

  # 予約確定
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:check_in_date,:check_out_date,:user_num, :room_id))
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to :reservations_index
    else
      render "confirm"
    end
  end

  # 再予約のページ
  def edit
    @reservation = Reservation.find(params[:id])
  end

  # 予約の更新
  def update
    @reservation = Reservation.find(params[:id])
     if @reservation.update(params.require(:reservation).permit(:check_in_date,:check_out_date,:user_num))
       redirect_to :reservations
     else
       render "edit"
     end
  end

  # 予約の削除
  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to :reservations_index
  end
end
