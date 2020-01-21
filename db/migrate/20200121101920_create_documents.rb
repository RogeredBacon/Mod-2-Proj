class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.text :data
      t.boolean :public?
      t.boolean :editable?

      t.timestamps
    end
  end
end
