class IdeasController < ApplicationController

  def index
    @ideas = Idea.find(:all)
    @ideas.sort! { |a,b| b.rating<=>a.rating }
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ideas }
    end
  end

  def new
    @idea = Idea.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @idea }
    end
  end

  def create
    @idea = Idea.new(params[:idea])
    respond_to do |format|
      if @idea.save
        flash[:notice] = 'Idea was successfully created.'
        format.html { redirect_to ideas_url }
        format.xml  { render :xml => @idea, :status => :created, :location => @idea }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @idea.errors, :status => :unprocessable_entity }
      end
    end
  end


  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    respond_to do |format|
      format.html { redirect_to(ideas_url) }
      format.xml  { head :ok }
    end
  end

  def vote_up
    @idea = Idea.find(params[:id])
    @idea.rating += 1
    @idea.save!
    respond_to do |format|
      format.js
    end
  end

  def vote_down
    @idea = Idea.find(params[:id])
    @idea.rating -= 1
    if @idea.rating < -10
      @idea.destroy
    else
      @idea.save!
    end 
    respond_to do |format|
      format.js
    end

  end


end# end class 
