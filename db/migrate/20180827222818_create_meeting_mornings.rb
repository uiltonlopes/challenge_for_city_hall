class CreateMeetingMornings < ActiveRecord::Migration[5.2]
  def change
    create_table :meeting_mornings do |t|
      t.references :member, foreign_key: true
      t.string :message_one
      t.string :message_two

      t.timestamps
    end
  end
end
