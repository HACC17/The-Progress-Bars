class CreateGrants < ActiveRecord::Migration[5.1]
  def change
    create_table :grants do |t|
      t.string 	:fiscal_year
      t.text 	:grant_type
      t.text  	:organization
      t.text 	:project
      t.decimal :amount, :precision => 10, :scale => 2
      t.text  	:location
      t.text  	:strategic_priority
      t.text  	:strategic_results
      t.integer :total_served
      t.integer :nh_served
      t.integer :grantStatusID
      
      t.timestamps
    end
  end
end
