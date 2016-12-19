# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts
  "SELECT title, SUM(amount) as pledge_amount
  FROM projects LEFT JOIN pledges
  ON projects.id = pledges.project_id
  GROUP BY(project_id)
  ORDER BY(projects.title);"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
  "SELECT name, age, SUM(amount) as total_pledges
  FROM users LEFT JOIN pledges
  ON users.id = pledges.user_id
  GROUP BY(user_id)
  ORDER BY(users.name);"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
  "SELECT title, SUM(amount) - funding_goal as excess
  FROM projects LEFT JOIN pledges
  ON projects.id = pledges.project_id
  GROUP BY(project_id)
  HAVING excess >= 0
  ORDER BY(title) ASC;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount
  "SELECT name, SUM(amount) as total_pledges
  FROM users LEFT JOIN pledges
  ON users.id = pledges.user_id
  GROUP BY(users.id)
  ORDER BY total_pledges ASC, name ASC;"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
  "SELECT category, amount
  FROM projects LEFT JOIN pledges
  ON projects.id = pledges.project_id
  WHERE projects.category = 'music';"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
  "SELECT category, SUM(amount)
  FROM projects LEFT JOIN pledges
  ON projects.id = pledges.project_id
  WHERE projects.category = 'books';"
end
