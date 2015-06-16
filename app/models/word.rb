class Word < ActiveRecord::Base

  belongs_to :category

  has_many :lessons, through: :lesson_words
  has_many :lesson_words, dependent: :destroy
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|attributes| attributes["content"].blank?}

  validates :content, presence: true, uniqueness: true

  user_learned = "id IN (SELECT word_id FROM lesson_words WHERE lesson_id IN (SELECT id FROM lessons WHERE user_id = %{idx}))"
  scope :learned, ->user{where(user_learned % {idx: user.id})}

  user_unlearned = "id NOT IN (SELECT word_id FROM lesson_words WHERE lesson_id IN (SELECT id FROM lessons WHERE user_id = %{idx}))"
  scope :unlearned, ->user{where(user_unlearned % {idx: user.id})}

  user_passed = "id IN (SELECT word_id FROM lesson_words WHERE ((lesson_id IN (SELECT id FROM lessons WHERE user_id = %{idx})) AND (answer_id IN (SELECT id FROM answers WHERE correct = 't'))))"
  scope :passed, ->user{where(user_passed % {idx: user.id})}

  lesson_passed = "id IN (SELECT word_id FROM lesson_words WHERE ((lesson_id = %{lesson_id}) AND (answer_id IN (SELECT id FROM answers WHERE correct = 't'))))"
  scope :lesson_passed, ->lesson{where(lesson_passed % {lesson_id: lesson.id})}

  scope :random_words, ->user{Word.unlearned(user).order("random()").limit(Settings.lesson_max_word)}
end
