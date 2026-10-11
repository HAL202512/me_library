class ReflectionsController < ApplicationController
  before_action :require_login
  before_action :set_memory, only: %i[new create]

  def new
    # 初期値として当日の日付をセット
    @reflection = @memory.reflections.build(recorded_on: Date.current)
  end

  def create
    @reflection = @memory.reflections.build(reflection_params)
    
    if @reflection.save
      redirect_to root_path, notice: '振り返りを記録しました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_memory
    # 他人の思い出に振り返りを書けないよう、current_userから探す
    @memory = current_user.memories.find(params[:memory_id])
  end

  def reflection_params
    params.require(:reflection).permit(:recorded_on, :content)
  end
end