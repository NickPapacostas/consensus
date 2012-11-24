class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages, :force => true do |t|
      t.text :body
      t.string :channel_id
      t.string :name
      t.timestamps
    end
  end
end
