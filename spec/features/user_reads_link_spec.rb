require 'rails_helper'

RSpec.describe 'Link' do
  it 'changes status when clicked' do
    login create :user
    link = create :link, url: 'http://www.example.com/'

    visit links_path

    expect { click_link link.title }.to change { Link.first.read }.from(false).to(true)
    expect(current_url).to eq('http://www.example.com/')
  end
end
