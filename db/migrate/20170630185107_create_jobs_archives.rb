class CreateJobsArchives < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs_archives do |t|
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
end
