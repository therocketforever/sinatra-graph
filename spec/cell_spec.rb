require 'rubygems'
require 'rack/test'
require 'sinatra'
require 'scruffy'
require 'sinatra/graph'

graph "Our Business", :prefix => '/graphs' do
  area "Buys", [1,5,2,3,4]
  bar "Sales", [5,2,6,2,1]
end

describe "sinatra-graph" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'renders the cell as expected, keeping the scope' do
    get '/graphs/our_business.svg'
    last_response.body.include?('<g id="scruffy_graph">').should == true
  end
end
