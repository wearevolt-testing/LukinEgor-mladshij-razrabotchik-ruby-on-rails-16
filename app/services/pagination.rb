module Pagination
  DEFAULT_START = 0
  DEFAULT_FINISH = 10

  def pages(page, per_page)
    if page && per_page
      start = (page - 1) * per_page + 1
      finish = page * per_page
      (start..finish)
    else
      (DEFAULT_START..DEFAULT_FINISH)
    end
  end
end
