class Api::BasicAuth::CommentsController < Api::ApiController
  include CommentsCrud
  http_basic_authenticate_with name: "auth_demo", password: "secret"
end
