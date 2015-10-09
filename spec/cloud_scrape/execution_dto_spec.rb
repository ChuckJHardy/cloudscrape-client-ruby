require "spec_helper"

describe CloudScrape::ExecutionDTO do
  subject(:run) { described_class.for(method: :get, id: id, url: url) }

  let(:id) { "813d13cd-bd5e-4f65-bd60-45eee6251865" }
  let(:url) { "result" }
  let(:response) { double("Faraday::Response", body: {}) }

  it "calls API with expected arguments" do
    expect(CloudScrape::API).to receive(:get).with(
      domain: "https://app.cloudscrape.com/api/",
      url: "executions/#{id}/#{url}",
      options: {
        api_key: "MY_API_KEY",
        format: "json"
      }
    ) { response }

    expect(run).to eq({})
  end
end
