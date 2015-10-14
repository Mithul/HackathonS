class TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tutorials = Tutorial.all
    respond_with(@tutorials)
  end

  def show
    respond_with(@tutorial)
  end

  def new
    @tutorial = Tutorial.new
    respond_with(@tutorial)
  end

  def edit
  end

  def create
    @tutorial = Tutorial.new(tutorial_params)
    @tutorial.save
    respond_with(@tutorial)
  end

  def update
    @tutorial.update(tutorial_params)
    respond_with(@tutorial)
  end

  def destroy
    @tutorial.destroy
    respond_with(@tutorial)
  end

  private
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    def tutorial_params
      params.require(:tutorial).permit(:name, :content)
    end
end
