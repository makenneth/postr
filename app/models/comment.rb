# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer          not null
#  commentable_type :string           not null
#  author_id        :integer          not null
#  body             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  belongs_to :author, foreign_key: :author_id, class_name: :User
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
