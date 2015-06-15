class Word < ActiveRecord::Base
  belongs_to :category
  
  has_many :lessons, through: :lesson_words
  has_many :lesson_words, dependent: :destroy
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true,
    reject_if: proc {|attributes| attributes["content"].blank?}

  validates :content, presence: true, uniqueness: true  
end
