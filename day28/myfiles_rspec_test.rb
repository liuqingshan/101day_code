require_relative './myfiles'

RSpec.describe MyFiles do
  describe '.upload' do
    it "invokes #upload! on the Net::SFTP's block argument" do
      conn_info = [ 'example.com', 'root', { password: 'root' } ]

      sftp_mock = double.as_null_object
      allow(Net::SFTP).to receive(:start).with(*conn_info).and_yield(sftp_mock)

      expect(sftp_mock).to receive(:upload!).with('./example.txt', '~/example.txt').and_return(true)

      MyFiles.upload('example.com', 'root', 'root')
    end
  end
end
