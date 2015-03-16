# coding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :search_before
    
	def search_before
	    @search_form = SearchForm.new (params[:search_form])
	end
       
end
