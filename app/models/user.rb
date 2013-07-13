class User < ActiveRecord::Base
	has_one :seed
  after_create :default_seeds
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatacampbx ble
         
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :username, presence: true, length: { minimum: 4, maximum: 50 }, uniqueness: { case_sensitive: false }


  private

    def default_seeds
      char =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
      siteseed  =  (0...50).map{ char[rand(char.length)] }.join

      num = [(0..9)].map{|i| i.to_a}.flatten
      userseed = (0...25).map{ num[rand(num.length)] }.join

      Seed.create(user_id: self.id, site_seed: siteseed, user_seed: userseed, rolls: 0) 
         
    end
end
