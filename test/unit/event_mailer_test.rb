require 'test_helper'

class EventMailerTest < ActionMailer::TestCase
  test "confirm" do
    @expected.subject = 'EventMailer#confirm'
    @expected.body    = read_fixture('confirm')
    @expected.date    = Time.now

    assert_equal @expected.encoded, EventMailer.create_confirm(@expected.date).encoded
  end

  test "remind" do
    @expected.subject = 'EventMailer#remind'
    @expected.body    = read_fixture('remind')
    @expected.date    = Time.now

    assert_equal @expected.encoded, EventMailer.create_remind(@expected.date).encoded
  end

end
