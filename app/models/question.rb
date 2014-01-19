class Question < ActiveRecord::Base

  belongs_to :quiz, touch: true
  has_many :answers, dependent: :destroy

  accepts_nested_attributes_for :answers, :reject_if => :all_blank, :allow_destroy => true

  default_scope -> { order(:created_at) }

  validates :text, presence: true
  
end
