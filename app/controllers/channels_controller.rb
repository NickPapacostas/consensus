class ChannelsController < ApplicationController
  # GET /Channels
  # GET /Channels.json
  def index
    @channels = Channel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @channels }
    end
  end

  # GET /Channels/1
  # GET /Channels/1.json
  def show
    @channel = Channel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @channel }
    end
  end

  # GET /Channels/new
  # GET /Channels/new.json
  def new
    if current_user
      @channel = Channel.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @channel }
      end
    else
      flash[:error] = "Sign in to create an Channel"
      respond_to do |format|
        format.html{redirect_to root_url}
      end
    end

  end

  # GET /Channels/1/edit
  def edit
    @channel = Channel.find(params[:id])
  end

  # POST /Channels
  # POST /Channels.json
  def create
    params[:channel][:id] = nil
    @channel = Channel.new(params[:channel])

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render json: @channel, status: :created, location: @channel }
      else
        format.html { render action: "new" }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Channels/1
  # PUT /Channels/1.json
  def update
    @channel = Channel.find(params[:id])

    respond_to do |format|
      if @channel.update_attributes(params[:channel])
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Channels/1
  # DELETE /Channels/1.json
  def destroy
    @channel = Channel.find(params[:id])
    @channel.destroy

    respond_to do |format|
      format.html { redirect_to channels_url }
      format.json { head :no_content }
    end
  end
end
