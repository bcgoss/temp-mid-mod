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

  it 'returns a set of links' do
    me = create :user_with_3_links, email: 'bcgoss@example.com'
    other = create :user_with_3_links

    get '/api/v1/links', {user_id: me.id}

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).count).to eq(3)
  end
end
