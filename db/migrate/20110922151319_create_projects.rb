class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :name
      t.date  :deadline
      t.float :funding_required
      t.references  :status
      t.references  :user
      t.timestamps
    end
    
    create_table :project_images do |t|
      t.string  :name
      t.string  :image_file_name
      t.string  :image_content_type
      t.integer :image_file_size
      t.references :project
    end
    
    create_table :project_videos do |t|
      t.string  :name
      t.string  :video_file_name
      t.string  :video_content_type
      t.integer :video_file_size      
      t.references :project
    end
    
    create_table :project_documents do |t|
      t.string  :name
      t.string  :doc_file_name
      t.string  :doc_content_type
      t.integer :doc_file_size      
      t.references :project
    end
  end
  
end
