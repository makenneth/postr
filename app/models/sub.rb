# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ActiveRecord::Base
  has_many :moderator_subs, inverse_of: :sub
  has_many :moderators,
   through: :moderator_subs,
   source: :moderator
   
  has_many :post_subs
  has_many :posts, through: :post_subs, source: :post
end
