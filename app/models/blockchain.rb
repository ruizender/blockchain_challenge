class Blockchain < ApplicationRecord
  validates :hash_name, presence: true, uniqueness: true

  def add_blockchain
    if Blockchain.last.present?
      self.prev_block = Blockchain.last.hash_name
    else
      self.prev_block = ""
    end
    self.block_index = rand(1..100)
    self.time = Time.now.to_s.remove('-',' ',':')[0,6]
    self.bits = rand(100..500)
  end
end
