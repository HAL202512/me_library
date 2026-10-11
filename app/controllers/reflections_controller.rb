class ReflectionsController < ApplicationController
  before_action :require_login
  before_action :set_memory
  before_action :set_reflection, only: %i[edit update]

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

  def edit
    # @reflection は set_reflection で取得済み
  end

  def update
    if @reflection.update(reflection_params)
      redirect_to root_path, notice: '振り返りを更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_memory
    # 他人の思い出に振り返りを書けないよう、current_userから探す
    @memory = current_user.memories.find(params[:memory_id])
  end

  def set_reflection
    @reflection = @memory.reflections.find(params[:id])
  end

  def reflection_params
    params.require(:reflection).permit(:recorded_on, :content)
  end
end