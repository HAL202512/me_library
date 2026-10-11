class MemoriesController < ApplicationController
  before_action :require_login

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

  def destroy
    memory = current_user.memories.find(params[:id])
    memory.destroy!
    
    # Turbo（Hotwire）環境での削除後のリダイレクトには status: :see_other を指定します
    redirect_to root_path, notice: '思い出を削除しました', status: :see_other
  end
  
  private

  def memory_form_params
    params.require(:memory_form).permit(:title, :author, :genre, :encountered_year, :content)
  end
end