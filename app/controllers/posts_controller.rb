# coding: utf-8

class PostsController < ApplicationController
    before_filter :authenticate_user!, only: :edit2

def index
    #@posts = Post.all(:order => "created_at DESC")
    @posts = Post.order(params[:sort])
    #@posts = Post.scoped(:order => "category_id ASC").page(params[:page]).per(10)
    @cateories = Category.all
end

  def day
    @posts = Post.all(:order => "created_at DESC")
    @post_days = @posts.group_by { |t| t.created_at.beginning_of_day }
  end

  def day_list
    @date = params[:date]
    y = @date[0,4]
    m = @date[4,2]
    d = @date[6,2]
    i = y + '-' + m + '-' + d

    @posts = Post.where(["created_at between ? and ?", "#{i} 00:00:00", "#{i} 24:00:00"]).order("created_at DESC")
  end

  def month
    @posts = Post.all(:order => "created_at DESC")
    @post_months = @posts.group_by { |t| t.created_at.beginning_of_month }
  end

  def month_list
    @date = params[:date]
      y = @date[0,4]
      m = @date[4,2]
      i = y + '-' + m

    @posts = Post.where(["created_at between ? and ?", "#{i}-1", "#{i}-31"]).order("created_at DESC")
  end

  def year
    @posts = Post.all(:order => "created_at DESC")
    @post_years = @posts.group_by { |t| t.created_at.beginning_of_year }
    
  end

  def year_list
    @date = params[:date]
    y = @date

    @posts = Post.where(["created_at between ? and ?", "#{y}-01-01 00:00:00", "#{y}-12-31 24:00:00"]).order("created_at DESC")
  end

    
    def show
        @post = Post.find(params[:id])
        @comment = Post.find(params[:id]).comments.build
        @cateories = Category.all
        @cat = Category.find_by_id(@post.category_id)
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = Post.new(params[:post])
        if @post.save
            redirect_to posts_path, notice: '作成されました！'
        else
        render action: 'new'
        end
    end
    
    def edit
        year = params[:year]
        month = params[:month]
        @post = Post.find(params[:id])
        @buy = Post.find(params[:id]).buys.build
        #@user = User.find(params[:id])
        #@buys = User.find(params[:id]).buys.build
    end
    
    def edit2
        @post = Post.find(params[:id])
    end
    
    def confirm
        @buy_amount = params[:buy][:amount]
        @post = Post.find(params[:id])
        @post.amount -= @buy_amount.to_i
        @buy = Post.find(params[:id]).buys.build
    end

    def update
        @post = Post.find(params[:id])
        @buy = Post.find(params[:id]).buys.build
        if @post.update_attributes(params[:post])
            @post.save(params[:post])
            redirect_to posts_path, notice: '更新されました！'
        else
          render action: 'edit'
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        render json: { post: @post }
    end
    
    def category_list
        @categories = Post.find(:all).group_by(&:category_id)
        @post = Post.scoped(:order => "created_at DESC").page(params[:page]).per(10)
        @post_categories = @post.group_by(&:category_id)
    end

    def artist_list
        @post = Post.scoped(:order => "created_at DESC").page(params[:page]).per(10)
        @post_categories = @post.group_by(&:artist)
    end

    def place_list
        @post = Post.scoped(:order => "created_at DESC").page(params[:page]).per(10)
        @post_categories = @post.group_by(&:place)
    end
    
    def cat_list
        cat = params[:cat]
        if cat.nil?
            @posts = Post.find(:all, :conditions => { :category_id => nil })
            @cat = Category.find_by_id(nil)
            else
            @posts = Post.find(:all, :conditions => { :category_id => cat })
            @cat = Category.find(cat)
        end
    end
    
end
