module CoursesHelper
  attr_reader :specialities

  def print_specialities(specialities)
    @specialities = specialities
    content =<<TPL
      .content-col.content-col_pl_0
        - @specialities.each.with_index do |item, index|
          - title = item[:parent].title
          - if index.even?
            = render partial: 'course_list_el', locals: {specialities: item[:specialities], title: title}
      .content-col.content-col_pr_0
        - @specialities.each.with_index do |item, index|
          - title = item[:parent].title
          - if index.odd?
            = render partial: 'course_list_el', locals: {specialities: item[:specialities], title: title}
TPL

    Slim::Template.new { content }.render self
  end
end
