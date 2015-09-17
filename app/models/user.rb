class User < ActiveRecord::Base
  enum role: [:admin, :manager, :client]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :client
  end

end
