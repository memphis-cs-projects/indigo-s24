# app/controllers/admin_controller.rb
module Admin
class Admin::AdminController < ApplicationController
    before_action :authenticate_admin!

    def index
      # Admin dashboard logic
    end

    def manage_listings
      @caravans = Caravan.all.order(created_at: :desc)
    end

    def view_orders
      # View orders logic
    end

    private

    def authenticate_admin!
      redirect_to root_path, alert: 'Access Denied' unless current_user&.admin?
    end
  end
end
