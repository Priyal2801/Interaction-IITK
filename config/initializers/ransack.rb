Ransack.configure do |c|
    # Change default search parameter key name.
    # Default key name is :q
    c.search_key = :query
    c.strip_whitespace = false
    %w[
        contained_within
        contained_within_or_equals
        contains
        contains_or_equals
        overlap
    ].each do |p|
        c.add_predicate p, arel_predicate: p, wants_array: true
    end
end