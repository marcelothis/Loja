class LinhaItemsController < ApplicationController
   include Current_carrinho
   before_action :set_cart, only: [:create] 
 
  before_action :set_linha_item, only: [:show, :edit, :update, :destroy]

  def index
    @linha_items = LinhaItem.all
    respond_with(@linha_items)
  end

  def show
    respond_with(@linha_item)
  end

  def new
    @linha_item = LinhaItem.new
    respond_with(@linha_item)
  end

  def edit
  end

  def create
    product = Product.find(params[:product_id])
    @linha_item = @carrinho.linha_items.build(product: product) 
    
    respond_to do |format|
       if @linha_item.save 
         format.html { redirect_to @linha_item.carrinho,
           notice: 'Item criado com sucesso' } 
         format.json { render action: 'Detalhes', 
           status: :created, location: @linha_item }
        else
          format.html { render action: 'Novo' } 
          format.json { render json: @linha_item.errors,
            status: :unprocessable_entity }
       end
    end
    @linha_item = LinhaItem.new(linha_item_params)
    @linha_item.save
    respond_with(@linha_item)
  end

  def update
    @linha_item.update(linha_item_params)
    respond_with(@linha_item)
  end

  def destroy
    @linha_item.destroy
    respond_with(@linha_item)
  end

  private
    def set_linha_item
      @linha_item = LinhaItem.find(params[:id])
    end

    def linha_item_params
      params.require(:linha_item).permit(:product_id, :carrinho_id)
    end
end
