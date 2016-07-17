class NewsCategory < ActiveRecord::Base

  validates_presence_of :name

  has_many :news, class_name: 'News', foreign_key: :category_id, dependent: :nullify

  class << self
    def options_for_select
      @options_for_select ||= build_options_for_select
    end
  end

private

  class << self
    def build_options_for_select
      all.map { |f| [f.name, f.id] }
    end
  end

end
