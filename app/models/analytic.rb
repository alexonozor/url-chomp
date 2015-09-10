class Analytic < ActiveRecord::Base
  geocoded_by :ip_address
  belongs_to :shorter
end
