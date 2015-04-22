class Api::DigestAuth::CommentsController < Api::ApiController
  include CommentsCrud
  REALM = "DigestAuth"
  USERS = {"auth_demo" => "secret" }

  before_action do
    authenticate_or_request_with_http_digest(REALM) do |username|
      USERS[username]
    end
  end
end
