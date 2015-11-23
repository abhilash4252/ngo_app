class OrganisationsController < ApplicationController
  def new
    @organisation = Organisation.new
    @organisation.user_id=current_user.id
  end

  def create
    @organisation = Organisation.new(organisation_params)
    @organisation.user_id=current_user.id
    @organisation.save
  end

  private
    def organisation_params
      params.require(:organisation).permit(:name,:user_id)
      
    end
end
