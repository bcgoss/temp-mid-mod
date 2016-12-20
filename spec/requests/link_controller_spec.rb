require 'rails_helper'

RSpec.describe 'Link API' do
  it 'accepts new links via post' do
    headers = { "ACCEPT" => "application/json" }
    params = { title: "Example", url: "http://www.example.com" }
    expect { post '/api/v1/links',
      headers: headers,
      params: params,
      as: :json
    }.to change { Link.count }.by 1

    expect(response).to have_http_status(:success)
    expect(Link.last.title).to eq('Example')
  end

  it 'returns an error' do

  end
end
