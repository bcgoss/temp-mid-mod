require 'rails_helper'

RSpec.describe 'Links Page' do
  it 'has a form for new links' do
    me = create :user
    login(me)

    visit links_path

    expect(page).to have_content('Url')
    expect(page).to have_content('Title')
  end

  it 'accepts a valid link' do
    me = create :user
    login(me)

    visit links_path

    fill_in 'Url', with: 'http://www.example.com'
    fill_in 'Title', with: 'Example'

    expect { click_button 'Add link' }.to change { Link.count }.by 1
  end

  it 'rejects invalid link' do
    me = create :user
    login(me)

    visit links_path

    fill_in 'Url', with: 'foo'
    fill_in 'Title', with: 'Example'

    expect { click_button 'Add link' }.to change { Link.count }.by 0
  end
end
