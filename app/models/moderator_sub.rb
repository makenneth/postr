# == Schema Information
#
# Table name: moderator_subs
#
#  id           :integer          not null, primary key
#  moderator_id :integer          not null
#  sub_id       :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ModeratorSub < ActiveRecord::Base
   validates :moderator, :sub, presence: true
   belongs_to :sub
   belongs_to :moderator,
      foreign_key: :moderator_id,
      primary_key: :id,
      class_name: :User
end
