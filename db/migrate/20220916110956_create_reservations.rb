class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.text :reason
      t.string :duration
      t.datetime :start_day
      t.datetime :end_day
      # t.references :user, foreign_key: { to_table: 'users' }
      t.references :hotel, foreign_key: { to_table: 'hotels' }

      t.timestamps
    end
  end
end
