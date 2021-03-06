class OrganisationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @organisations = current_user.organisations
  end

  def new
    if params[:user_id] == current_user.id.to_s 
      @organisation = Organisation.new
    else
      redirect_to new_user_organisation_path(current_user)
    end
  end

  def show
    @organisation = Organisation.find(params[:id])

    if @organisation.user_id != current_user.id
      redirect_to user_organisations_url
    end
  end

  def create
    @organisation = current_user.organisations.new(organisation_params)
    if @organisation.save
      flash[:notice] = "Organisation created succesfully"
      #redirect_to [current_user,@orgnisation]
      redirect_to user_organisation_path(current_user, @organisation)
    else
      flash[:alert] = "Orgainisation creation failed"
      render :new
    end
  end

  def destroy
    Organisation.find(params[:id]).destroy
    flash[:success] = "Organisation deleted"
    redirect_to user_organisations_path(current_user)
  end
  private
    def organisation_params
      params.require(:organisation).permit(:name,:user_id)
    end
end
