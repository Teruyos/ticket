# coding: utf-8

class BuysController < ApplicationController
    
    def create
        @post = Post.find(params[:post_id])
        @buy = Post.find(params[:post_id]).buys.new(params[:buy])

        if @buy.save
            redirect_to posts_path
        else
            render :template => "posts/edit"
        end
    end 
end
