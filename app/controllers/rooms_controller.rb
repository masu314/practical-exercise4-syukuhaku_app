class RoomsController < ApplicationController

  # 施設の新規登録ページ
  def new
    @room = Room.new
  end

  # 施設の新規登録
  def create
    @room = Room.new(params.require(:room).permit(:room_name, :room_price, :room_introduction, :room_image, :room_address))
    @room.user_id = current_user.id
    if @room.save
      redirect_to :own_rooms
    else
      render "new"
    end
  end

  # 施設の詳細ページ
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  # 施設の編集ページ
  def edit
    @room = Room.find(params[:id])
  end

  # 施設の更新
  def update
    @room = Room.find(params[:id])
     if @room.update(params.require(:room).permit(:room_name, :room_price, :room_introduction, :room_image, :room_address))
       redirect_to :own_rooms
     else
       render "edit"
     end
  end

  #施設の削除
  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to :own_rooms
  end

  # 施設の検索結果ページ
  def search
    if params[:area].present? && params[:keyword].present?
      @rooms = Room.where('Rooms.room_address LIKE ? AND (Rooms.room_name LIKE ? OR Rooms.room_introduction LIKE ?)', "%#{params[:area]}%","%#{params[:keyword]}%","%#{params[:keyword]}%").order(created_at: :desc)
    elsif params[:area].present?
      @rooms = Room.where('Rooms.room_address LIKE ?', "%#{params[:area]}%").order(created_at: :desc)
    elsif params[:keyword].present?
      @rooms = Room.where('Rooms.room_name LIKE ? OR Rooms.room_introduction LIKE ?', "%#{params[:keyword]}%","%#{params[:keyword]}%").order(created_at: :desc)
    else
    end
  end

  # 施設の一覧ページ
  def own
    @user = current_user
    @rooms = @user.rooms
  end

end
