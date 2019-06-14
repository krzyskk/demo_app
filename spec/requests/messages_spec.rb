# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Messages", type: :request do
  describe "GET /v1/messages" do
    subject { get "/v1/messages" }
    it "Responses with status ok" do
      subject
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /v1/find_message" do
    let(:params) { { query: 'query'} }

    subject { get "/v1/search_message", params: params }
    it "Responses with status ok" do
      subject
      expect(response).to have_http_status(200)
    end
  end
end
