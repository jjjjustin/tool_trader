class ToolsController < ApplicationController
before_action :set_tool, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!

  # GET /posts
  # GET /posts.json
  def index
    @tool = Tool.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @tool = Tool.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json

  def create
    @tool = Tool.new(tool_params)
    user = User.find(params[:user_id])
    @tool.user_id = current_user.id
    respond_to do |format|
      if @tool.save
        format.html { redirect_to user_tools_path, notice: 'Tool was successfully added.' }
        format.json { render :show, status: :created, location: @tool }
      else
        format.html { render :new }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @tool.update(tool_params)
        format.html { redirect_to @tool, notice: 'Tool was successfully updated.' }
        format.json { render :show, status: :ok, location: @tool }
      else
        format.html { render :edit }
        format.json { render json: @tool.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @tool.destroy
    respond_to do |format|
      format.html { redirect_to tool_url, notice: 'Tool was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tool
      @tool = Tool.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tool_params
      params.require(:tool).permit(:tool_type, :tool_model, :condition, :point_cost, :availability)
    end
end
