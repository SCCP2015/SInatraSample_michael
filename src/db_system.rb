# coding: utf-8
require 'singleton'

# Databaselike System
class Database
  include Singleton

  FILE = 'data'

  def get
    if File.exist?(FILE)
      File.read(FILE)
    else
      ''
    end
  end

  def post(word)
    if File.exist?(FILE)
      data = File.read(FILE)
      File.write(FILE, data + word + '\n')
      data + word
    else
      File.write(FILE, word)
      word
    end
  end

  def put(word)
    File.write(FILE, word + '\n')
    word
  end

  def delete
    File.write(FILE, '')
    ''
  end
end
