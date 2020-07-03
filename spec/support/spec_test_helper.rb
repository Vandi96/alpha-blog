module SpecTestHelper
    def sign_in_as(user)
        post login_path, params: { session: { email: user.email, password: "jelszo"}}
      end
end