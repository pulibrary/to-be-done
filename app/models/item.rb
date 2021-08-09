# frozen_string_literal: true
class Item < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  VALID_STATUSES = ["Ready to Start", "In Progress", "Paused", "Finished"].freeze
  validates :status, presence: true, inclusion: { in: VALID_STATUSES }

  def finished?
    status == "Finished"
  end
end
