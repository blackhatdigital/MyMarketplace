class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:advocate, :new, :create, :show, :edit, :update, :destroy]
 
  def advocate
    @packages = Package.where(user_id: current_user).order("created_at DESC")
  end
  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.all.order("created_at DESC")
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
  end

  # GET /packages/new
  def new
    @package = Package.new
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(package_params)
    @package.user_id = current_user.id

    Stripe.api_key = ENV["stripe_api_key"]
    token = params[:stripeToken]

    recipient = Stripe::Recipient.create(
        :name => current_user.email,
        :type => "individual",
        :bank_account => token
        )

      current_user.recipient = recipient.id
      current_user.save

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:name, :description, :price, :sample_required, :timeframe_days, :audience_size, :target_id, :user_id)
    end
end
