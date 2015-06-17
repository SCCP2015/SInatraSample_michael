require 'data_mapper'

# Model Class
class Word
  include DataMapper::Resource

  property :id, Serial
  property :msg, String
  property :uid, String
end

class User
  include DataMapper::Resource

  property :id, Serial
  property :uid, String
  property :pass, String
end

DataMapper.finalize
