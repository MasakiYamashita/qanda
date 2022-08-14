class QuestionsController < ApplicationController
  # 質問一覧表示
  def index
    @questions = Question.all
    # p "@questions : #{@questions}"
  end

  # 質問詳細ページ表示
  def show
    # p "paramsのid : #{params[:id]}"
    @question = Question.find(params[:id])
    p "@question :  #{@question}"
  end

  # 質問の作成画面
  def new
    @question = Question.new
  end

  # 質問の登録処理
  def create
    # Questionモデルを初期化
    @question = Question.new(question_params)
    # QuestionモデルをDBへ保存
    if @question.save
      # showへリダイレクト
      # p "@question : #{@question}"
      redirect_to @question
    else
      render 'new', status: :unprocessable_entity
      # renderはテンプレートを指定することができる。'new'のテンプレートを指定。
      # unprocessable_entityはステータスコード422。Validation Errorのときに返すべきステータス。
    end
  end

  # 質問の編集画面
  def edit
    @question = Question.find(params[:id])
  end

  #質問の更新処理
  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  # 質問の削除
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :name, :content)
  end
end
