class ConsolidatorController < ApplicationController
	def companies
		@companies = Company.all
	end

	def show
  		if request.get?
  			@company = Company.find(params[:id])
  			@companies = Company.all
  			@companies = (Company.find(:all, :conditions => ["id != ?", @company.id]))
  		
  		else
  			@company = Company.find(params[:id])	
  			selected_subsidiaries = params[:company][:subsidiary_ids]
  			if selected_subsidiaries
	  			if selected_subsidiaries.count{ |item| !item.blank? } == 0
	  				Company.where(parent_id: @company.id).update_all(parent_id: nil)
	  			else
	  				Company.where(parent_id: @company.id).update_all(parent_id: nil)
	  				Company.where(id: selected_subsidiaries.reject! { |c| c.empty? }).update_all(parent_id: @company.id)	
	  			end
	  		end

			if @company.update(company_params)
				redirect_to @company
			else
				render 'show'
			end
  		end
  	end

	def new
  		@company = Company.new
	end

	def create
		@company = Company.new(company_params)
		if @company.save
			redirect_to @company
		else
			render 'companies'
		end
  	end

  private
  	def company_params
  		params.require(:company).permit(:name, :black_males, :black_females, :white_males, :white_females)
  	end
end
