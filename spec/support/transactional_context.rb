# frozen_string_literal: true

shared_context "transactional", transactional: true do
  prepend_before(:each) do
    ActiveRecord::Base.connection.begin_transaction(joinable: false)
  end

  append_after(:each) do
    ActiveRecord::Base.connection.rollback_transaction
  end
end
