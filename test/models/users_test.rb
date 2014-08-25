require_relative '../test_helper.rb'

class UserModelTest < MiniTest::Test

  def setup
    @user = User.new
    @user.email = 'jphager2@gmail.com'
    @user.password = 'password'
    @user.save
  end

  def test_user_is_user
    assert true
  end

end
