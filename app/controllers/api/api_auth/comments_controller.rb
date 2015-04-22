class Api::ApiAuth::CommentsController < Api::ApiController
  include CommentsCrud

  before_action do
    unless api_authenticated?("secret_key")
      render :text => "401 Access denied.", :status => :unauthorized
    end
  end
end
