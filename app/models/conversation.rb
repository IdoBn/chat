class Conversation < ActiveRecord::Base
	has_many :messages
	has_many :participants
	has_many :users, through: :participants

	validates_uniqueness_of :name
end
