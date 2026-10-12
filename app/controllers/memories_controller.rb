class MemoriesController < ApplicationController
  before_action :require_login
  before_action :set_memory, only: %i[show edit update destroy]

  def show
    # @memory は set_memory で取得
  end

  def new
    @memory_form = MemoryForm.new
  end

  def create
    @memory_form = MemoryForm.new(memory_form_params)
    @memory_form.user_id = current_user.id

    if @memory_form.save
      # 成功時は一旦ホーム画面へリダイレクト
      redirect_to root_path, notice: '思い出を記録しました'
    else
      # 失敗時は入力内容を保持したままフォームを再描画
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    # 既存の作品と思出データをFormオブジェクトに渡す
    @memory_form = MemoryForm.new(
      title: @memory.work.title,
      author: @memory.work.author,
      genre: @memory.work.genre,
      encountered_year: @memory.encountered_year,
      content: @memory.content,
      tag_ids: @memory.tag_ids
    )
  end

def update
    @memory_form = MemoryForm.new(memory_form_params)
    @memory_form.user_id = current_user.id
    
    if @memory_form.update(@memory)
      redirect_to memory_path(@memory), notice: '思い出を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    #memory = current_user.memories.find(params[:id])
    @memory.destroy!
    
    # Turbo（Hotwire）環境での削除後のリダイレクトには status: :see_other を指定します
    redirect_to root_path, notice: '思い出を削除しました', status: :see_other
  end

  def set_memory
    @memory = current_user.memories.find(params[:id])
  end

  private

  def memory_form_params
    params.require(:memory_form).permit(:title, :author, :genre, :encountered_year, :content, tag_ids: [])
  end
end