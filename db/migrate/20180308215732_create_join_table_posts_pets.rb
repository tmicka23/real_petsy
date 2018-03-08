class CreateJoinTablePostsPets < ActiveRecord::Migration[5.1]
  def change
    create_join_table :posts, :pets do |t|
      t.index [:post_id, :pet_id]
      t.index [:pet_id, :post_id]
    end
  end
end
