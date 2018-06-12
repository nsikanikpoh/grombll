class CommentsController < ApplicationController
  before_action :set_comment, only: [:download_file, :show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @grumble = Grumble.find(params[:gumbler_id])
    @comment = @grumble.comments.new
  end

  # GET /comments/1/edit
  def edit
    
  end

  # POST /comments
  # POST /comments.json
  def create
    @grumble = Grumble.find(params[:grumble_id])
    @comment = @grumble.comments.create(comment_params)
    @comment.commenter_id = current_user.id
    @comment.commenter_type = current_user.type
    @comment.save
    respond_to do |format|
      if @comment.save
        format.html { redirect_to comment_grumble_path(@grumble), notice: 'Comment was successfully posted.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_grumble_path(@comment.grumble), notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @grumble = Grumble.find(params[:grumble_id])
    @comment = @grumble.comments.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comment_grumble_url(@grumble), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  def download_file
    send_file @comment.attachment.path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit!
    end
end
