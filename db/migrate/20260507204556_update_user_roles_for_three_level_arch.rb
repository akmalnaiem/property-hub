class UpdateUserRolesForThreeLevelArch < ActiveRecord::Migration[8.1]
  def up
    # Move existing users (was 1) to the new user index (2)
    # 0 stays admin
    User.where(role: 1).update_all(role: 2)
  end

  def down
    # Move users back to role 1
    User.where(role: 2).update_all(role: 1)
  end
end
