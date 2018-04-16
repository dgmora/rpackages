class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name, null: false
      t.string :title
      t.string :version, null: false
      t.text :authors, null: false
      t.text :maintainers, null: false
      t.timestamp :publication_date, null: false
      t.text :description
      t.timestamps
    end
     
    #Assuing: It's not possible to publish twice the same version
    add_index :packages, [:name, :version], unique: true
  end
end
