# coding: utf-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :search
    
def search
    @search_form = SearchForm.new (params[:search_form])
    @posts = Post.all(:order => "created_at DESC")
    @posts = Post.scoped(:order => "created_at ASC").page(params[:page]).per(10)

    if @search_form.q.present?
     @posts = @posts.artist_or_content_or_title_matches @search_form.q
    end
end
       
end
