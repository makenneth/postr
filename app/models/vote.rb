# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  voteable_id   :integer          not null
#  voteable_type :string           not null
#  user_id       :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Vote < ActiveRecord::Base
   validates :voteable_id, :voteable_type, :user_id, presence: true
   validates :voteable_id, uniqueness: {scope: :user_id, :voteable_type }

   belongs_to :voteable, polymorphic: true

end
