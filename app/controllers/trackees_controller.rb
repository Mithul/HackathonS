class TrackeesController < ApplicationController
  before_action :set_trackee, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def userTrack
    users=params[:users]
    userss=users.split(',')
    render :text => userss.to_yaml
    userss.each do |i|
      t=Trackee.find_by_name(i)
      if t != nil
        if t.track == true
          puts 'nothiin'
          t.login_count = t.login_count+1
          t.last_login = Time.now
        end
      else
        t=Trackee.new
        t.name=i
        t.login_count = 1
        t.last_login = Time.now
      end
      t.save
    end
  end

  def index
    @trackees = Trackee.all
    respond_with(@trackees)
  end

  def show
    respond_with(@trackee)
  end

  def new
    @trackee = Trackee.new
    respond_with(@trackee)
  end

  def edit
  end

  def create
    @trackee = Trackee.new(trackee_params)
    flash[:notice] = 'Trackee was successfully created.' if @trackee.save
    respond_with(@trackee)
  end

  def update
    flash[:notice] = 'Trackee was successfully updated.' if @trackee.update(trackee_params)
    respond_with(@trackee)
  end

  def destroy
    @trackee.destroy
    respond_with(@trackee)
  end

  private
    def set_trackee
      @trackee = Trackee.find(params[:id])
    end

    def trackee_params
      params.require(:trackee).permit(:name, :last_login, :login_count, :trackBrowser, :track, :flag)
    end
end
