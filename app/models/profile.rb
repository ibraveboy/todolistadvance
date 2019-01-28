class Profile < ActiveRecord::Base
  belongs_to :user
  validates_each :gender do |r,a,v|
      r.errors.add(a,"must be male or female") if (v != "male" && v!= "female")
  end
  validates :gender, inclusion: {in: %w(female)}, if: proc {|obj| obj.first_name=="Sue"}
  validates :first_name,presence: true, on: :create, if: proc { |obj| obj.last_name.nil? }
  validates :last_name, presence: true, if: proc { |obj| obj.first_name.nil? }

  def self.get_all_profiles(min,max)
    return self.where(birth_year:min..max).order(birth_year: :asc).to_a
  end

  
end
