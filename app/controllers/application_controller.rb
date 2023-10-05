class ApplicationController < ActionController::Base
  after_action :track_action

  def default_translation
    "nasb"
  end
  helper_method :default_translation

  def popular_verses
    @popular_verses ||= Ahoy::Event.where(name: "$verse")
      .select(
        "properties->>'verse' as verse",
        "count(*) as count",
        "sum(count(*)) over() total_count"
      )
      .where("time >= ?", 1.week.ago)
      .group(Arel.sql("properties->>'verse'"))
      .order(Arel.sql("count(properties->>'verse') desc"))
  end
  helper_method :popular_verses

  private

  def track_action
    ahoy.track "$view", request.path_parameters
  end
end
