# frozen_string_literal: true

RSpec.describe Bitcoin::Fees::Client do
  before do
    stub_request(:get, 'https://bitcoinfees.earn.com/api/v1/fees/recommended')
      .to_return(status: 200, body: '{"fastestFee":14, "halfHourFee":14, "hourFee":12}', headers: {})
    stub_request(:get, 'https://bitcoinfees.earn.com/api/v1/fees/list')
      .to_return(
        status: 200,
        body: '{"fees":[{"minFee":0,"maxFee":0,"dayCount":3,"memCount":0,"minDelay":54,"maxDelay":10000,"minMinutes":600,"maxMinutes":10000}]}',
        headers: {}
      )
  end

  let(:config) do
    Struct.new(:host).new(Bitcoin::Fees::Configuration::DEFAULT_HOST)
  end

  subject { Bitcoin::Fees::Client.new(config) }

  it 'returns the correct recommended' do
    expect(subject.recommended).to eq('fastestFee' => 14,
                                      'halfHourFee' => 14,
                                      'hourFee'     => 12)
  end

  it 'returns the correct list' do
    expect(subject.list).to eq('fees' => [
                                 {
                                   'dayCount'   => 3,
                                   'maxDelay'   => 10_000,
                                   'maxFee'     => 0,
                                   'maxMinutes' => 10_000,
                                   'memCount'   => 0,
                                   'minDelay'   => 54,
                                   'minFee'     => 0,
                                   'minMinutes' => 600
                                 }
                               ])
  end
end
