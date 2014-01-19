class Solution < ActiveRecord::Base
  belongs_to :quiz_version
  belongs_to :user
end
