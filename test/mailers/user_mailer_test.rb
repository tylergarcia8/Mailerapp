require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "follow_up" do
  	target_email = 'me@example.com'
    mail = UserMailer.follow_up(target_email).deliver_now

    assert_not ActionMailer::Base.deliveries.empty?

    # assert_equal "Follow up", mail.subject

    assert_equal "How are things going?", mail.subject

    assert_equal [target_email], mail.to

    assert_equal ["from@example.com"], mail.from

    # assert_match "Hi", mail.body.encoded

    assert_match "Twitter and Facebook", mail.body.encoded

  end

end
