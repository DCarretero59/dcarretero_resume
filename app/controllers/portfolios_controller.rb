class PortfoliosController < ApplicationController
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  def index
    @portfolio_items = Portfolio.all
  end

  def show
  end
  
  def create
    @item = Portfolio.new(portfolio_params)
    if @item.save
      redirect_to portfolios_url, notice: 'created.' 
    else
      render :new
    end
  end
  
  def new
    @item = Portfolio.new
  end

  def edit
  end
  
  def update
    if @item.update(portfolio_params)
      redirect_to portfolios_url, notice: 'Portfolio was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    if @item.destroy
      redirect_to portfolios_url, notice: 'Portfolio was deleted.'
    else
      redirect_to portfolios_url, notice: 'Error deleting portfolio.'
    end
  end
  
  private
    def set_portfolio
      @item = Portfolio.find(params[:id])
    end
    
    def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body)
    end
    
end
