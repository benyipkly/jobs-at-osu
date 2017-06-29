class CreateJobs < ActiveRecord::Migration[5.1]
  def self.up
    create_table :jobs do |t|
      t.integer :job_id, :null => false
      t.datetime :published
      t.datetime :updated
      t.string :link
      t.string :title
      t.text :content
      t.string :author

      t.timestamps

      t.index :job_id, unique: true
    end
  end

  def self.down
    drop_table :jobs
  end
end
