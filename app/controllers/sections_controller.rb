class SectionsController < ApplicationController
  # GET /sections
  # GET /sections.json

  before_filter :require_login, :only => [:show, :edit]

  def require_login
    redirect_to root_url, notice: 'Please login.' unless session[:user_id].present?
  end


  def index
    @sections = Section.all

    @user = User.find_by_id(session["zebra"])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sections }
    end
  end

  # GET /sections/1
  # GET /sections/1.json
  def show
    @section = Section.find(params[:id])
    @API_KEY = "17321802"               # should be a string
    @API_SECRET = "3a90fda1362d50aed4b04f3f01456153d2e956be"

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/new
  # GET /sections/new.json
  def new
    @section = Section.new

    @API_KEY = "17321802"               # should be a string
    @API_SECRET = "3a90fda1362d50aed4b04f3f01456153d2e956be"          # should be a string
    @OTSDK = OpenTok::OpenTokSDK.new @API_KEY, @API_SECRET

    @session_id = @OTSDK.createSession( request.ip )


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @section }
    end
  end

  # GET /sections/1/edit
  def edit
    @section = Section.find(params[:id])
  end

  # POST /sections
  # POST /sections.json
  def create
    @section = Section.new(params[:section])

    respond_to do |format|
      if @section.save
        format.html { redirect_to @section, notice: 'Section was successfully created.' }
        format.json { render json: @section, status: :created, location: @section }
      else
        format.html { render action: "new" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  def get_token
    @section = Section.find_by_id(params["section_id"])

    if session[:user_id] == @section.user_id
      ot_role = OpenTok::RoleConstants::MODERATOR
    else
      ot_role = OpenTok::RoleConstants::PUBLISHER
     end

    @API_KEY = '17321802'
    @API_SECRET = '3a90fda1362d50aed4b04f3f01456153d2e956be'
    @OTSDK = OpenTok::OpenTokSDK.new @API_KEY, @API_SECRET
    session[:token] = @OTSDK.generateToken :session_id => @session_id, :role => ot_role

    redirect_to :back
  end

  # PUT /sections/1
  # PUT /sections/1.json
  def update
    @section = Section.find(params[:id])

    respond_to do |format|
      if @section.update_attributes(params[:section])
        format.html { redirect_to @section, notice: 'Section was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sections/1
  # DELETE /sections/1.json
  def destroy
    @section = Section.find(params[:id])
    @section.destroy

    respond_to do |format|
      format.html { redirect_to sections_url }
      format.json { head :no_content }
    end
  end
end
