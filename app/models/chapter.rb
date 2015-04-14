class Chapter < ActiveRecord::Base
  has_many :likes
  has_many :chapter_tag_maps
  has_many :tags, through: :chapter_tag_maps
  belongs_to :dashboard

  validates :manga, :number, presence: true

  before_save { self.number = Integer(number) }

  default_scope { order(created_at: :desc) }

  def title
    "#{self.manga} #{self.number}"
  end

  def set_dashboard_from_bu_api(bu_dashboard)
    unless dashboard = self.dashboard
      if found = Dashboard.find_by(url: bu_dashboard.url)
        dashboard = found
      else
        dashboard = Dashboard.new()
      end
    end

    dashboard.update(
      url:         bu_dashboard.url,
      title:       bu_dashboard.title,
      genres:      bu_dashboard.genres,
      description: bu_dashboard.description,
    )

    dashboard.scanlators = Scanlator
      .find_and_update_or_create(bu_dashboard.scanlators)

    self.update(dashboard_id: dashboard.id)
    dashboard
  end
end
