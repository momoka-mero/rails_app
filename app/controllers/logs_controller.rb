class LogsController < ApplicationController

  #Auth前では操作できないように
  before_action :authenticate_user!, only: [:create]
  before_action :edit_delete_user, only: [:edit, :update, :destroy]

  def index
    @logs = Log.all
    @log = Log.new
  end

  def show
    @log = Log.find(params[:id])
    @like = Like.new
  end

  def edit
    @log = Log.find(params[:id])
  end

  def destroy
    log = Log.find(params[:id])
    log.delete
  end


  def create
    @log = Log.new(log_params)
    @log.user_id = current_user.id
    if @log.save
      flash.notice = '送信しました。'
      redirect_back(fallback_location: root_path)
    else
      flash.now.alert = 'エラー'
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def log_params
    params.require(:log).permit(:brealfast, :lunch, :dinner, :comment)
  end

  def edit_delete_user
    unless Log.find(params[:id]).user.id.to_i == current_user.id
        redirect_to logs_path(current_user)
    end
  end
end