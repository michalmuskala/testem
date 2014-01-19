class Answer < ActiveRecord::Base

  belongs_to :question, touch: true

  validates :text, presence: true

  default_scope -> { order(:created_at) }

end
