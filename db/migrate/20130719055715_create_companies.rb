class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :black_males
      t.string :black_females
      t.string :white_males
      t.string :white_females

      t.timestamps
    end
  end
end
