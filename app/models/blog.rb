class Blog < ApplicationRecord
  belongs_to :user
  has_many :feeds

  validates :content, presence: true, 
  length: { maximum: 6000 }
end
