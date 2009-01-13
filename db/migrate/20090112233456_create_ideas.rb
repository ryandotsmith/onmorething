class CreateIdeas < ActiveRecord::Migration
  def self.up
    create_table :ideas do |t|
      t.string :jist
      t.integer:rating, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :ideas
  end
end
