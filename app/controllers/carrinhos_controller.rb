class CarrinhosController < ApplicationController
  before_action :set_carrinho, only: [:show, :edit, :update, :destroy]

  def index
    @carrinhos = Carrinho.all
    respond_with(@carrinhos)
  end

  def show
    respond_with(@carrinho)
  end

  def new
    @carrinho = Carrinho.new
    respond_with(@carrinho)
  end

  def edit
  end

  def create
    @carrinho = Carrinho.new(carrinho_params)
    @carrinho.save
    respond_with(@carrinho)
  end

  def update
    @carrinho.update(carrinho_params)
    respond_with(@carrinho)
  end

  def destroy
    @carrinho.destroy
    respond_with(@carrinho)
  end

  private
    def set_carrinho
      @carrinho = Carrinho.find(params[:id])
    end

    def carrinho_params
      params[:carrinho]
    end
end
