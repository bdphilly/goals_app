class Goal < ActiveRecord::Base
  validates :user_id, :body, :title, presence: true

  belongs_to :user, inverse_of: :goals
  include Commentable
end
