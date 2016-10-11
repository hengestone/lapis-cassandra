import Paginator from require "lapis.db.pagination"
math = math
class OffsetPaginator extends Paginator
    per_page: 10
    new: (@model, clause={}, opts={}) =>
        @_clause = clause
        @_opts = opts
        @_cursor = false

    get_page: (page) =>
        unless @_cursor
            @_cursor = @model\_get_cursor(@_clause, @_opts)
        
        col = @model\collection!
        col\getmore(@_cursor, 2, 2)
        --page = (math.max 1, tonumber(page) or 0) - 1
        

    num_pages: =>
        math.ceil @total_items! / @per_page

    total_items: =>
      unless @_count
        @_count = @model\count @_clause
      @_count

{ :OffsetPaginator, :Paginator}