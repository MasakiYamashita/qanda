class Answer < ApplicationRecord
  belongs_to :question  # Answerモデルは、Questionモデルと紐づきがあることを示している
end
