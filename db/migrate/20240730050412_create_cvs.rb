class CreateCvs < ActiveRecord::Migration[7.0]
  def change
    create_table :cvs do |t|
      t.string :name
      t.string :surname
      t.string :patronymic

      t.timestamps
    end
  end
end
