module CoinHelper

	def flipper
		flipped = rand(2)

		if flipped == 1
			return  "heads"
		else
			return  "tails"
		end	
	end
end
