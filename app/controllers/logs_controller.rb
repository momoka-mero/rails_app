class LogsController < ApplicationController

  #Auth前では操作できないように
  before_action :authenticate_user!, only: [:create]

  def index
    @logs = Log.all
    @log = Log.new
  end

  def show
    @log = Log.find(params[:id])
    @like = Like.new
  end

  def create
    @log = Log.new(log_params)
    @log.user_id = current_user.id
    if @log.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def log_params
    params.require(:log).permit(:brealfast, :lunch, :dinner, :comment, :goal_id)
  end
end
