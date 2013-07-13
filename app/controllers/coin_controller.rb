class CoinController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check, only: [:flip]


	def index
		@coin = "home"
	end

  	def flip
  		ans = flipper()
	  	token = current_user.tokens
	  	bet = params[:bet].to_i
	  	
	  	if ans == params[:setting]
	  		token = token + bet
	  		current_user.update_attribute(:tokens, token)
	  		flash.now[:won] = "You won #{bet} tokens!"
	  	else
	  		token = token - bet
	  		current_user.update_attribute(:tokens, token)
	  		flash.now[:lost] = "You lost #{bet} tokens"
	  	end
	  	@coin = ans
	  	render 'index'
  	end

  	def show
  		@users = User.paginate(per_page: 25, order: 'tokens DESC', page: params[:page])
  	end

  	private
  		def check
  			if params[:setting].nil?
  				flash.now[:error] = "You must choose heads or tails"
  				render 'index'
  			elsif params[:bet].empty?
  				flash.now[:error] = "You must enter a bet amount"
  				render 'index'
  			end

  		end
end
