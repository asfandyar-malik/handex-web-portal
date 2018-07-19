class FinancialsController < ApplicationController

  before_action :set_financial, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised, only: [:exportinformation, :update]

  def index
    @tradeinfo = Tradeinfo.find(params[:tradeinfo_id])
    @financial = @tradeinfo.financial
  end

  # GET /financials/new
  def new
    flash[:notice] = "Entering Financial new"
    @tradeinfo = Tradeinfo.find(params[:tradeinfo_id])
    @financial = @tradeinfo.build_financial
  end

  # POST /financials
  # POST /financials.json
  def create
    flash[:notice] = "Entering Financials create"
    @tradeinfo = Tradeinfo.find(params[:tradeinfo_id])
    @financial = @tradeinfo.build_financial(financial_params)

    if @financial.save
      redirect_to accepted_tradeinfo_path(@tradeinfo, @financial, @buyer), notice: "Financial Created...."
    else
      flash[:alert] = "Something went wrong while creating...."
      render :new
    end
  end


  # PATCH/PUT /financials/1
  # PATCH/PUT /financials/1.json
  def update
    if @financial.update(financial_params)
      flash[:notice] = "Financials Updated...."
      redirect_to accepted_tradeinfo_path(@tradeinfo, @financial)
    else
      flash[:alert] = "Something went wrong while updating"
    end
  end

  # DELETE /financials/1
  # DELETE /financials/1.json
  def destroy
    @financial.destroy
    respond_to do |format|
      format.html { redirect_to financials_url, notice: 'financial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_financial
    @financial = Financial.find(params[:id])
  end

  def is_authorised
    @tradeinfo = Tradeinfo.find(params[:tradeinfo_id])
    redirect_to root_path, alert: "You don't have permission" unless current_user.id = @tradeinfo.user_id
  end

  def financial_params
    params.require(:financial).permit(:total_financing_required, :time_duration, :projected_sales_18_19, :projected_sales_20_21, :net_profitability,
                  :net_worth, :ifsc, :outstanding_bank_nbfc_facility, :name_of_institution, :type_of_loan, :size_of_loan,
                  :defaulted_or_overdue, :explain_defaulted_or_overdue, :receivables_factored, :explain_receivables_factored)
  end

  def is_ready_first_step
    @financial.total_financing_required && @financial.time_duration
  end

  def is_ready_second_step
    @financial.total_financing_required && @financial.time_duration && @financial.projected_sales_18_19 && @financial.projected_sales_20_21 && @financial.net_profitability
  end

end