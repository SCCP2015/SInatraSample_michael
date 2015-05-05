# coding: utf-8
require 'spec_helper'

describe Database do

  describe 'GET' do
    it 'return contents of data' do
      content = File.read('data')
      expect(Database.instance.get).to eq content
      # empty case
      File.unlink('data')
      expect(Database.instance.get).to eq ''
    end
  end

  describe 'POST' do
    it 'return contents of data with posted one' do
      # empty case
      File.unlink('data')
      expect(Database.instance.post('hoge')).to eq 'hoge'
      # adding words to existing contents
      content = File.read('data')
      expect(Database.instance.post('foo')).to eq content + 'foo'
      content = File.read('data')
      expect(Database.instance.post('bar')).to eq content + 'bar'
    end
  end

  describe 'PUT' do
    it 'return posted body' do
      expect(Database.instance.put('test')).to eq 'test'
    end
  end

  describe 'DELETE' do
    it 'return empty array' do
      expect(Database.instance.delete).to eq ''
    end
  end

end
