class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.references :category, foreign_key: true, null: true
      t.references :user, foreign_key: true
      t.references :agent, foreign_key: { to_table: :users }, null: true
      t.string :name
      t.string :email
      t.string :title
      t.text :message
      t.integer :status, default: 0
      t.integer :priority, null: true

      t.timestamps
    end
  end
end
