# == Schema Information
#
# Table name: vote_counts
#
#  id         :integer          not null, primary key
#  vote_id    :integer          not null
#  count      :integer          default("0")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VoteCount < ActiveRecord::Base
   validates :vote_id, presence: true
end
