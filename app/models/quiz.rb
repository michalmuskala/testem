class Quiz < ActiveRecord::Base

  has_many :questions, dependent: :destroy
  has_many :quiz_versions

  alias_method :versions, :quiz_versions

  accepts_nested_attributes_for :questions, :reject_if => :all_blank, :allow_destroy => true

  validates :name, presence: true

  def current_version 
    if versions.last && versions.last.created_at >= updated_at
      versions.last
    else
      versions.create
    end
  end

  def as_json(options = default_json_options)
    super
  end

  def to_json(options = default_json_options)
    super
  end

private

  def default_json_options
    {
      only: [:name],
      include: {
        questions: {
          only: [:text],
          include: {
            answers: {
              only: [:text, :correct]
            }
          }
        }
      }
    }
  end
end
