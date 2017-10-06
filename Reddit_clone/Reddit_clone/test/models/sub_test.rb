# == Schema Information
#
# Table name: subs
#
#  id                                                              :integer          not null, primary key
#  moderator_id                                                    :integer          not null
#  created_at                                                      :datetime         not null
#  updated_at                                                      :datetime         not null
#  description                                                     :string
#  #<ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition :string
#  title                                                           :string
#

require 'test_helper'

class SubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
