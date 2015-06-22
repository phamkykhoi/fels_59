class Lesson < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :words, through: :lesson_words
  has_many :lesson_words, dependent: :destroy

  accepts_nested_attributes_for :lesson_words, allow_destroy: true

  before_create :init_words

  private
  def init_words
    self.words = category.words.random_words user
  end
end
