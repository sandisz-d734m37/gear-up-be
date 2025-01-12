class Trip < ApplicationRecord
  has_many :trip_items, dependent: :destroy
  has_many :trip_users, dependent: :destroy
  has_many :users, through: :trip_users
  has_many :items, through: :trip_items
  belongs_to :area

  validate :end_date_later_than_start
  validates_presence_of :name, :start_date, :end_date, :description, :host_id
  validates_inclusion_of :start_date, in: Date.today..Date.today.next_year

  def end_date_later_than_start
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "can not be before start date.")
    end
  end

  def self.user_trips(id)
    joins(:trip_users).where(trip_users: {user_id: id})
  end

  def users_to_remove(ids)
    trip_users.where.not(user_id: ids)
  end
end
