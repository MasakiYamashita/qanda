class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :name
      t.text :content
      t.references :question, null: false, foreign_key: true  # Answerモデルは、Questionモデルと紐づきがあることを示し、Questionテーブルの対象カラムにないスカラ値はAnswerテーブルの対象カラムに対象の値を設定できないようにする（整合性担保のため）

      t.timestamps
    end
  end
end
