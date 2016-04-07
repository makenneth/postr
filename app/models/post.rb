# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  content    :text
#  sub_id     :integer
#  author_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  count      :integer          default("0")
#

class Post < ActiveRecord::Base
  validates :author_id, :title, presence: true
  belongs_to :author, class_name: :User
  has_many :post_subs, inverse_of: :post
  has_many :subs, through: :post_subs, source: :sub
  has_many :comments, as: :commentable
  has_many :votes, as: :voteable
  def down_vote
     self.count -= 1
     self.save
  end

  def up_vote
     self.count += 1
     self.save
  end
end
