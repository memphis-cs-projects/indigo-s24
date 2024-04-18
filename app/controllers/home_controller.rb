class HomeController < ApplicationController
  # before_action :authenticate_user! # Uncomment if authentication is required

  def show
    # Fetch the caravans, sizes, adventures, exterior colors, and interior themes
    @caravans = Caravan.paginate(page: params[:page], per_page: 10)
    @sizes = Caravan.pluck(:size).uniq
    @adventures = Caravan.pluck(:adventure).uniq
    @exterior_colors = Caravan.pluck(:exterior_color).uniq
    @interior_themes = Caravan.pluck(:interior_theme).uniq || []

    # Apply filters
    @caravans = apply_filters(@caravans)

    if @caravans.empty?
      flash[:notice] = 'No caravans available.'
    end
  end

  private

  def apply_filters(caravans)
    caravans = caravans.where(size: params[:size]) if params[:size].present?
    caravans = caravans.where(adventure: params[:adventure]) if params[:adventure].present?
    caravans = caravans.where(exterior_color: params[:exterior_color]) if params[:exterior_color].present?
    caravans = caravans.where(interior_theme: params[:interior_theme]) if params[:interior_theme].present?
    if params[:sort_by].present? && ["asc", "desc", "ASC", "DESC"].include?(params[:sort_by])
      caravans = caravans.order(price: params[:sort_by])
    end

    # Search across multiple fields
    if params[:search].present?
      caravans = caravans.where("name ILIKE ? OR size ILIKE ? OR adventure ILIKE ? OR exterior_color ILIKE ? OR interior_theme ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    caravans
  end
end
