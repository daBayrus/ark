class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :name
      t.date  :deadline
      t.float :funding_required
      t.text  :description
      t.text  :video_link
      t.string  :status
      t.references  :user
      t.timestamps
    end
    
    create_table :project_images do |t|
      t.string  :image
      t.references :project
    end
    
    create_table :project_documents do |t|
      t.string  :document
      t.references :project
    end
  end
  
end
