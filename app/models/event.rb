class Event < ActiveRecord::Base
  belongs_to :user

  has_many :attendees
  has_many :users, :through => :attendees

  has_many :comments

  validates :edate, :presence => true
  validate :date_validate_for_future_date

  def date_validate_for_future_date
  	 if edate.present? && edate < Date.today
  	 	errors.add(:date, "Only future date is allowed!")
  	 end
  end 
end
