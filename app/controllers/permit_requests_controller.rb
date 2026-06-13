class PermitRequestsController < ApplicationController
  before_action :require_login
  before_action :set_permit_request, only: [:show]

  def index
    if current_user.admin?
      redirect_to admin_dashboard_path
    else
      @permit_requests = current_user.permit_requests.order(created_at: :desc)
    end
  end

  def show
    if @permit_request.user != current_user && !current_user.admin?
      flash[:alert] = "You are not authorized to view this permit."
      redirect_to dashboard_path
    elsif @permit_request.status != "approved"
      flash[:alert] = "Only approved permits can be viewed or printed."
      redirect_to dashboard_path
    end
  end

  def new
    @permit_request = current_user.permit_requests.build
  end

  def create
    @permit_request = current_user.permit_requests.build(permit_request_params)
    @permit_request.status = "pending" # ensure status is pending
    if @permit_request.save
      flash[:notice] = "Your permit request has been submitted successfully."
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_permit_request
    @permit_request = PermitRequest.find(params[:id])
  end

  def permit_request_params
    params.require(:permit_request).permit(:dog_name, :breed, :age, :owner_name, :owner_phone)
  end
end
