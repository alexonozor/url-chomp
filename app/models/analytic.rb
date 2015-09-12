class Analytic < ActiveRecord::Base
  geocoded_by :ip_address
  belongs_to :shorter

  def self.top_countries(link_id)
    self.select('country, count("id") as count').where(shorter_id: link_id).order("count desc").group('country').limit(5)
  end

  def self.top_referrers(link_id)
    self.select('refferer, count("id") as count').where(shorter_id: link_id).order("count desc").group('refferer').limit(5)
  end

  def self.top_device(link_id)
    self.select('device, count("id") as count').where(shorter_id: link_id).order("count desc").group('device').limit(5)
  end

end
