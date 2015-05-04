# coding: utf-8
require 'spec_helper'

describe 'DELETE' do
  it 'return empty array' do
    expect(Database.instance.delete).to eq ''
  end
end
