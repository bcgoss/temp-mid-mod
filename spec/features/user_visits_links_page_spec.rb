require 'rails_helper'

RSpec.describe 'Links Page' do
  it 'has a form for new links' do
    me = create :user
    login(me)

    visit links_path

    expect(page).to have_content('Url')
    expect(page).to have_content('Title')
  end
end
