# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @report = reports(:one)
  end

  test '#editable?' do
    assert @report.editable?(@report.user)
  end

  test '#editable? レポートに紐づかないユーザーを渡したとき' do
    user = User.new(name: 'hoge', encrypted_password: 'password')
    assert_not @report.editable?(user)
  end

  test '#created_on' do
    assert @report.created_on, Time.zone.today
  end
end
