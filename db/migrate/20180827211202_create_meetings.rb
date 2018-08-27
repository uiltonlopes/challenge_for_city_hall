class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.references :member, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end
