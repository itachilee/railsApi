class AddVoteToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :vote, :string
  end
end
