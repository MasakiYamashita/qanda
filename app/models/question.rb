class Question < ApplicationRecord
  has_many :answers, dependent: :destroy # Questionsテーブルが1として、Answersテーブルが多の関係があることを示している。「dependent: :destroy」で、Questionsテーブルの1つのレコードが削除されるとき、対象レコードの主キーのスカラ値に紐づいているAnswersテーブルの対象の複数レコードは削除される。

  validates :title, presence: true
  validates :name, presence: true
  validates :content, presence: true, length: { minimum: 5 }
end
