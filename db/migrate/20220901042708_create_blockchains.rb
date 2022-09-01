class CreateBlockchains < ActiveRecord::Migration[7.0]
  def change
    create_table :blockchains do |t|
      t.string :hash_name
      t.string :prev_block
      t.integer :block_index
      t.integer :time
      t.integer :bits

      t.timestamps
    end
  end
end
