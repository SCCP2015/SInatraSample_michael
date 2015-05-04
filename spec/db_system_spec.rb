# coding: utf-8
require 'spec_helper'

describe 'GET' do
  it 'return contents of data' do
    expect(Database.instance.get).to eq File.read('data')
  end
end

describe 'POST' do
  it 'return contents of data with posted one' do
    content = File.read('data')
    expect(Database.instance.post("test")).to eq content + "test"
  end
end

describe 'PUT' do
  it 'return posted body' do
    expect(Database.instance.put("test")).to eq "test"
  end
end

describe 'DELETE' do
  it 'return empty array' do
    expect(Database.instance.delete).to eq ''
  end
end
