# == Schema Information
#
# Table name: votes
#
#  id            :integer          not null, primary key
#  voteable_id   :integer          not null
#  voteable_type :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Vote < ActiveRecord::Base
   validates :voteable_id, :voteable_type, presence: true
   belongs_to :voteable, polymorphic: true
end
