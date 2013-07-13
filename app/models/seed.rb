class Seed < ActiveRecord::Base
	belongs_to :user
  attr_accessible :user_id, :site_seed, :user_seed, :rolls
end
