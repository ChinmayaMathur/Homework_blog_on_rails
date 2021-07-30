class CommentsController < ApplicationController
      before_action :authenticate_user! 

      def create
            @post = Post.find params[:post_id]  
            comment_params = params.require(:comment).permit(:body)
            @comment = Comment.new comment_params
            @comment.user = current_user 
            @comment.post = @post
            @comment.save
            if @comment.persisted?
                  redirect_to post_path(@post), notice: 'comment created!'
            else
                  redirect_to post_path(@post)
            end
      end

      def destroy
            @post = Post.find params[:post_id]
            @comment = Comment.find params[:id]

            if can?(:crud, @comment)
                  @comment.destroy
                  redirect_to post_path(@post), notice: "Comment Deleted"
            else
                  redirect_to root_path, alert: "Not authorized"
            end
      end
end
