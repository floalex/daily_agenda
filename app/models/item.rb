class Item < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }

  def days_left
    (DateTime.now.to_date - created_at.to_date).to_i
  end
end
