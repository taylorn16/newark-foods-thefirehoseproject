class CreateComments < ActiveRecord::Migration
  def change
    create_table(:comments) do |t|

      t.text :message
      t.string :rating

      # Foreign Keys
      t.integer :user_id
      t.integer :place_id
      t.timestamps

      t.timestamps
    end

    # Add Indexes for Fast Lookup
    add_index :comments, [:user_id, :place_id]      # Fast lookup by user AND place
    add_index :comments, :place_id                  # Fast lookup by place only
  end
end
