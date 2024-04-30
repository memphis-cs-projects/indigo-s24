class HomeController < ApplicationController
  # before_action :authenticate_user! # Uncomment if authentication is required

  def show
    # Start with a base scope and then apply ordering and pagination
    base_scope = Caravan.all
    ordered_scope = base_scope.order(price: :asc) # Default sorting is ascending by price
    ordered_scope = base_scope.order(price: :desc) if params[:sort_by] == 'price_desc'
    ordered_scope = base_scope.order(created_at: :desc) if params[:sort_by] == 'created_at_desc'
    paginated_caravans = ordered_scope.paginate(page: params[:page], per_page: 10)

    # Apply filters
    @caravans = apply_filters(paginated_caravans)

    @sizes = base_scope.pluck(:size).uniq
    @adventures = base_scope.pluck(:adventure).uniq
    @exterior_colors = base_scope.pluck(:exterior_color).uniq
    @interior_themes = base_scope.pluck(:interior_theme).uniq

    if @caravans.empty?
      flash.now[:notice] = 'No caravans available.' # Use flash.now to avoid persisting the notice
    end
  end

  private

  def apply_filters(caravans)
    caravans = caravans.where(size: params[:size]) if params[:size].present?
    caravans = caravans.where(adventure: params[:adventure]) if params[:adventure].present?
    caravans = caravans.where(exterior_color: params[:exterior_color]) if params[:exterior_color].present?
    caravans = caravans.where(interior_theme: params[:interior_theme]) if params[:interior_theme].present?

    # Search across multiple fields
    if params[:search].present?
      caravans = caravans.where("name ILIKE ? OR size ILIKE ? OR adventure ILIKE ? OR exterior_color ILIKE ? OR interior_theme ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    end

    caravans
  end
end
