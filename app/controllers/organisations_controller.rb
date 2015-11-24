class OrganisationsController < ApplicationController
  def index
    @organisations = current_user.organisations.all
  end

  def new
    @organisation = current_user.organisations.new
  end

  def show
    @organisation = Organisation.find(params[:id])

    if @organisation.user_id != current_user.id
      redirect_to organisations_url
    end
  end

  def create
    @organisation = current_user.organisations.new(organisation_params)
    if @organisation.save
      flash[:notice] = "Organisation created succesfully"
      redirect_to @organisation
    else
      flash[:alert] = "Orgainisatio creation failed"
      render :new
    end
  end
  def destroy
    Organisation.find(params[:id]).destroy
    flash[:success] = "Organisation deleted"
    redirect_to organisations_url
  end
  private
    def organisation_params
      params.require(:organisation).permit(:name,:user_id)
    end
end
