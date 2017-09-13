class GrantsController < ApplicationController
  before_action :set_grant, only: [:show]
  
  #rudimentary authentication
  http_basic_authenticate_with name: "oha", password: "progress_bars", except: :index

  #mass upload of data
  def import
  	Grant.import(params[:file])
    respond_to do |format|
      format.html { redirect_to grants_url, notice: 'Successful Upload!' }
      format.json { head :no_content }
    end
  end

  def kill
  	@all = Grant.all
    @all.each do |t|
    	t.destroy
	end
    respond_to do |format|
      format.html { redirect_to grants_url, notice: 'All Grant Data was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
	
	
  # GET /grants
  # GET /grants.json
  def index
	preferredY = "amount"
    @grants = Grant.all
    @grantData = @grants.order("fiscal_year DESC")
    @grant_count = @grants.count
	@award_amount = @grants.pluck(:amount).sum
	@served = @grants.pluck("sum(nh_served)", "sum(total_served)")
	@inProgress = @grants.where(grantStatusID: 2).count
	
	#These are arrays of the unique values for each parameter. Unique locations, unique fiscal years...
	@uLocations = @grants.distinct.pluck(:location)	
	@uYears = @grants.distinct.order(:fiscal_year).pluck(:fiscal_year)
	@uPriorities = @grants.distinct.pluck(:strategic_priority)
	@uResults = @grants.distinct.pluck(:strategic_results)
	
	#Total funding, grouped by location
	@sumLocations = @grants.group("location").pluck("sum(amount)")
		
	#Total funding, grouped by strategic priority
	@sumPriorities = @grants.group("strategic_priority").pluck("sum(amount)")
	
	#total funding, grouped by strategic results
	@sumResults = @grants.group("strategic_results").pluck("sum(amount)")
	
	#This is a 2-d array of the preferred measurement for each island, for each year.
	#Inner array is each year. Outer array is location.
	#For example, [0][0] would be a location in 2013, but [0][1] is 2014.
	@amountPerYearByLocation = Array.new
	@uLocations.each do |loc|
			@locArray = Array.new
			@uYears.each do |year|
				@locArray.push(@grants.where(location: loc).where(fiscal_year: year).sum(preferredY).to_f)
			end
			@amountPerYearByLocation.push(@locArray)
	end
	#This is a 2-d array of the preferred measurement for each strategic priority, for each year.
	#Inner array is each year. Outer array is location.
	#For example, [0][0] would be a priority in 2013, but [0][1] is 2014.
	@amountPerYearByPriority = Array.new
	@uPriorities.each do |pri|
			@priArray = Array.new
			@uYears.each do |year|
				@priArray.push(@grants.where(strategic_priority: pri).where(fiscal_year: year).sum(preferredY).to_f)
			end
			@amountPerYearByPriority.push(@priArray)
	end
	#This is a 2-d array of the preferred measurement for each strategic results, for each year.
	@amountPerYearByResults = Array.new
	@uResults.each do |res|
			@resArray = Array.new
			@uYears.each do |year|
				@resArray.push(@grants.where(strategic_results: res).where(fiscal_year: year).sum(preferredY).to_f)
			end
			@amountPerYearByResults.push(@resArray)
	end
		
 
 	#export to all data to excel
	respond_to do |f|
		f.html
		f.xls
		f.pdf do
			render :pdf => "Report Pulled on" + " " + "#{Time.now.strftime("%m/%d/%Y")}", :orientation => 'Landscape'
		end
    end
 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grant
      @grant = Grant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grant_params
      params.require(:grant).permit(:fiscal_year, :grant_type, :organization, :project, :amount, :location, :strategic_priority, :strategic_results, :total_served, :nh_served, :grantStatusID)
    end
end
