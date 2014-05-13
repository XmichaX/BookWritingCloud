class ChunksController < ApplicationController
  # GET /chunks
  # GET /chunks.json
  def index
    @chunks = Chunk.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chunks }
    end
  end

  # GET /chunks/1
  # GET /chunks/1.json
  def show
    @chunk = Chunk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chunk }
    end
  end

  # GET /chunks/new
  # GET /chunks/new.json
  def new
    @chunk = Chunk.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chunk }
    end
  end

  # GET /chunks/1/edit
  def edit
    @chunk = Chunk.find(params[:id])
  end

  # POST /chunks
  # POST /chunks.json
  def create
    @chunk = Chunk.new(chunk_params)

    respond_to do |format|
      if @chunk.save
        format.html { redirect_to @chunk, notice: 'Chunk was successfully created.' }
        format.json { render json: @chunk, status: :created, location: @chunk }
      else
        format.html { render action: "new" }
        format.json { render json: @chunk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chunks/1
  # PATCH/PUT /chunks/1.json
  def update
    @chunk = Chunk.find(params[:id])

    respond_to do |format|
      if @chunk.update_attributes(chunk_params)
        format.html { redirect_to @chunk, notice: 'Chunk was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chunk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chunks/1
  # DELETE /chunks/1.json
  def destroy
    @chunk = Chunk.find(params[:id])
    @chunk.destroy

    respond_to do |format|
      format.html { redirect_to chunks_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def chunk_params
      params.require(:chunk).permit(:book, :content, :section, :title, :user)
    end
end