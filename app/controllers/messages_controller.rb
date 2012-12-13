class MessagesController < ApplicationController
  # GET /Messages
  # GET /Messages.json
  def index
    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /Messages/1
  # GET /Messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /Messages/new
  # GET /Messages/new.json
  def new
    if current_user
      @message = Message.new

      respond_to do |format|
        format.html # new.html.erb
        format.json { render json: @message }
      end
    else
      flash[:error] = "Sign in to create an Message"
      respond_to do |format|
        format.html{redirect_to root_url}
      end
    end

  end

  # GET /Messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /Messages
  # POST /Messages.json
  def create
    params[:message][:id] = nil
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Messages/1
  # PUT /Messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Messages/1
  # DELETE /Messages/1.json
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end
end
