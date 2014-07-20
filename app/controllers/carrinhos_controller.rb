class CarrinhosController < ApplicationController
	before_action :set_carrinho, only: [:show, :edit, :update, :destroy]
	rescue_from ActiveRecord::RecordNotFound, with: :carrinho_invalido

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
		@carrinho.destroy if @carrinho.id == session[:carrinho_id]
		session[:carrinho_id] = nil
		respond_to do |format|
			format.html { redirect_to products_url, notice: 'O seu carrinho esta vazio agora.' }
			format.json { head :no_content }
		end
	end
	
  private
    def set_carrinho
      @carrinho = Carrinho.find(params[:id])
    end

    def carrinho_params
      params[:carrinho]
    end
	
	def carrinho_invalido
		logger.error "Erro na tentativa de acesso ao carrinho!!! #{params[:id]}"
		redirect_to products_url, notice: 'carrinho invalido'
	end
end