require 'spec_helper'
require 'lotus/app'
require 'support/fixtures/flowers_controller'

describe 'Basic Request' do
  before(:all) do
    Lotus::Routes = Lotus::Router.draw do
      get '/flowers',            controller: 'flowers'
      get '/flowers/set_body',   controller: 'flowers', action: 'set_body'
      get '/flowers/set_status', controller: 'flowers', action: 'set_status'
      get '/flowers/set_header', controller: 'flowers', action: 'set_header'
    end
  end

  let(:app) { Lotus::App.new(Lotus::Routes) }

  it 'is successful' do
    get '/flowers'
    last_response.should be_ok
  end

  it 'sets response body' do
    get '/flowers/set_body'
    last_response.should be_ok
    last_response.body.should == 'Lotus'
  end

  it 'sets a status' do
    get '/flowers/set_status'
    last_response.status.should be(403)
  end

  it 'sets an header' do
    get '/flowers/set_header'
    last_response.headers['Content-Type'].should == 'application/json'
  end

  it 'is not found' do
    get '/unknown'
    last_response.status.should be(404)
  end
end
