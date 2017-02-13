require 'rails_helper'

describe Users::SessionsController, type: :controller do
  let!(:user) do
    create(:user, password: 'qwerty1234',
                        password_confirmation: 'qwerty1234')
  end
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  it 'has no cookie set when not logged in' do
    get :new
    expect(cookies['user_id']).to be nil
  end

  context 'user sign in' do
    it 'does not remember user' do
      post user_session_path
      expect(cookies['user_id']).not_to be nil
    end
    it 'remembers user'
  end

  context 'user logs out' do
    it 'has not cookies '
  end
end
