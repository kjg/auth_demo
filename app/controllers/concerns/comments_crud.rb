module CommentsCrud
  extend ActiveSupport::Concern

  included do
    before_action :set_comment, only: [:show, :edit, :update, :destroy]
    # GET /comments
    # GET /comments.json
    def index
      @comments = Comment.all
      render "comments/index"
    end

    # GET /comments/1
    # GET /comments/1.json
    def show
      render "comments/show"
    end

    # GET /comments/new
    def new
      @comment = Comment.new
      render "comments/new"
    end

    # GET /comments/1/edit
    def edit
      render "comments/edit"
    end

    # POST /comments
    # POST /comments.json
    def create
      @comment = Comment.new(comment_params)

      respond_to do |format|
        if @comment.save
          format.html { redirect_to path_prefix << @comment, notice: 'Comment was successfully created.' }
          format.json { render "comments/show", status: :created, location: path_prefix << @comment }
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
          format.html { redirect_to path_prefix << @comment, notice: 'Comment was successfully updated.' }
          format.json { render "comments/show", status: :ok, location: path_prefix << @comment  }
        else
          format.html { render "comments/edit" }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /comments/1
    # DELETE /comments/1.json
    def destroy
      @comment.destroy
      respond_to do |format|
        format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_comment
        @comment = Comment.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def comment_params
        params.require(:comment).permit(:author, :body)
      end

      def path_prefix
        self.class.to_s.deconstantize.underscore.split("/")
      end
      helper_method :path_prefix
  end
end
