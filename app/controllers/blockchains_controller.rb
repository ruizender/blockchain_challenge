class BlockchainsController < ApplicationController
  before_action :set_blockchain,  only: %i[destroy]
  add_flash_types :info, :error, :warning
  
  def index
    @blockchain = Blockchain.new
    @pagy, @blockchains = pagy(Blockchain.all.order('created_at DESC'))
  end
  
  def create
    @blockchain = Blockchain.new(blockchain_params)
    @blockchain.add_blockchain
    respond_to do |format|
      if @blockchain.save
        format.turbo_stream do
          render turbo_stream: [turbo_stream.prepend('blockchain-table', partial: "blockchains/partials/table_line", locals: { blockchain: @blockchain }), turbo_stream.update('notice', 'Successfully created')]
        end
      else
        format.html { render :index, status: :unprocessable_entity }

        @pagy, @blockchains = pagy(Blockchain.all.order('created_at DESC'))

      end
    end
  end
  
  def destroy
    @blockchain.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [turbo_stream.remove(@blockchain), turbo_stream.update('notice', 'Successfully deleted')]
      end
    end
  end
  
  private
  
  def set_blockchain
    @blockchain = Blockchain.find(params[:id])
  end
  
  def blockchain_params
    params.require(:blockchain).permit(:id, :hash_name, :prev_block, :block_index, :time, :bits)
  end
  
end
