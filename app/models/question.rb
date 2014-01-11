class Question < ActiveRecord::Base

  belongs_to :quiz
  has_many :answers

  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true

  validates :text, presence: true
end
