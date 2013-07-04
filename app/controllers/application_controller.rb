class ApplicationController < ActionController::Base
	include CoinHelper
	protect_from_forgery
end
