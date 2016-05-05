require 'rails_helper'

RSpec.describe "Productions", :type => :request do
  describe "GET /productions" do
    it "works! (now write some real specs)" do
      get productions_path
      expect(response).to have_http_status(200)
    end
  end
end
