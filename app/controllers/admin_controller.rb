class AdminController < ApplicationController
  before_action :require_login
  before_action :require_admin
  before_action :set_permit_request, only: [:approve, :reject]

  def index
    @pending_requests = PermitRequest.where(status: "pending").order(created_at: :asc)
    @processed_requests = PermitRequest.where.not(status: "pending").order(updated_at: :desc)
  end

  def approve
    tag_number = generate_unique_tag
    if @permit_request.update(status: "approved", tag_number: tag_number)
      flash[:notice] = "Permit for #{@permit_request.dog_name} has been approved with Tag: #{tag_number}."
    else
      flash[:alert] = "Failed to approve permit: #{@permit_request.errors.full_messages.to_sentence}"
    end
    redirect_to admin_dashboard_path
  end

  def reject
    if @permit_request.update(status: "rejected")
      flash[:notice] = "Permit for #{@permit_request.dog_name} has been rejected."
    else
      flash[:alert] = "Failed to reject permit: #{@permit_request.errors.full_messages.to_sentence}"
    end
    redirect_to admin_dashboard_path
  end

  private

  def set_permit_request
    @permit_request = PermitRequest.find(params[:id])
  end

  def generate_unique_tag
    loop do
      # e.g., TAG-2026-X8Y9Z
      tag = "TAG-#{Time.current.year}-#{SecureRandom.alphanumeric(5).upcase}"
      break tag unless PermitRequest.exists?(tag_number: tag)
    end
  end
end
