class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    @members = Member.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])
    
		# get all the payments of this member
		@current_payments = @member.payments.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new
		
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    respond_to do |format|
      if @member.save
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    can_delete = @member.balance == 0
		@member.destroy if can_delete
		  respond_to do |format|
		  	if can_delete
		  		format.html { redirect_to members_url }
		  	else
		  		format.html { redirect_to @member, notice: "Cannot delete this member since balance is not zero" }
		    end
		    format.json { head :no_content }
		  end
#		else
#			format.html { redirect_to members_url, notice: 'Can not delete #{@member.name}, balance is not 0' }
  end
  
  def add_ten
  	@member = Member.find(params[:id])
#  	@member.update_attributes(:balance => @member.balance + 10)
  	@member.balance = @member.balance + 10
  	@member.save
  	redirect_to @member
  end
end
