class User < ApplicationRecord
  # Direct associations

  has_many   :trips,
             :dependent => :destroy

  has_many   :received_follow_requests,
             :class_name => "FollowRequest",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_follow_requests,
             :class_name => "FollowRequest",
             :foreign_key => "sender_id",
             :dependent => :destroy

  # Indirect associations

  has_many   :followers,
             :through => :received_follow_requests,
             :source => :sender

  has_many   :following,
             :through => :sent_follow_requests,
             :source => :recipient

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
