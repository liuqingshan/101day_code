require 'minitest/autorun'
require_relative './myfiles.rb'

describe MyFiles do
  describe '.upload' do
    it "invokes #upload! on the Net::SFTP's block argument" do
      conn_info = lambda do |host, user, opt|
        assert_equal 'example.com', host
        assert_equal 'root', user
        assert_equal ({ password: 'root' }), opt
      end

      sftp_mock = Minitest::Mock.new

      sftp_mock.expect :upload!, true, ['./example.txt', '~/example.txt']

      Net::SFTP.stub :start, conn_info, sftp_mock do
        MyFiles.upload('example.com', 'root', 'root')
      end

      sftp_mock.verify
    end
  end
end
