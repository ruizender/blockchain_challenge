class Blockchain < ApplicationRecord
  validates :hash_name, presence: true
  validates :hash_name, uniqueness: true
  after_create :set_block_index
  
  def add_blockchain
    if Blockchain.last.present?
      self.prev_block = Blockchain.last.hash_name
    else
      self.prev_block = ""
    end

    self.time = Time.now.to_s.remove('-',' ',':')[0,6]
    self.bits = rand(10000..500000)
  end

  def set_block_index
    self.block_index = self.id
    self.save
  end
end

