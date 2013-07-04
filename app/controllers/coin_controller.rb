class CoinController < ApplicationController
	before_filter :authenticate_user!
	before_filter :check, only: [:flip]

	def index
	end

  	def flip
  		ans = flipper()
	  	token = current_user.tokens
	  	bet = params[:bet].to_i

	  	if ans == params[:setting]
	  		token = token + bet
	  		current_user.update_attribute(:tokens, token)
	  		flash[:notice] = "You won #{bet} tokens!"
	  	else
	  		token = token - bet
	  		current_user.update_attribute(:tokens, token)
	  		flash[:notice] = "You lost #{bet} tokens"
	  	end
	  	render 'index'
  	end


  	private
  		def check
  			if params[:setting].nil?
  				flash[:error] = "You must choose heads or tails"
  			end
  			if params[:bet].empty?
  				flash[:error] = "You must enter a bet amount"
  			end
  			render 'index'
  		end
end
