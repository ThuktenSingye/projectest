class ChangeDefaultValueForVoteInProjects < ActiveRecord::Migration[8.0]
  def change
    change_column_default :projects, :vote, 0
  end
end
