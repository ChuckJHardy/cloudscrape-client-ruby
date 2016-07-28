require "spec_helper"

describe CloudscrapeClient::ExecutionDTO do
  subject(:run) { described_class.for(method: :get, id: id, url: url) }

  let(:id) { "813d13cd-bd5e-4f65-bd60-45eee6251865" }
  let(:url) { "result" }
  let(:response) { double("Faraday::Response", status: 200, body: {}) }

  it "calls API with expected arguments" do
    expect(CloudscrapeClient::API).to receive(:get).with(
      domain: "https://api.dexi.io/",
      url: "executions/#{id}/#{url}",
      options: {
        api_key: CloudscrapeClient.configuration.api_key,
        format: "json"
      }
    ) { response }

    expect(run).to eq({})
  end
end
