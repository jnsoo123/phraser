module ControllerSpecHelper
  def expect_redirect_to_sign_in
    expect(response).to redirect_to new_user_session_path
  end
end
