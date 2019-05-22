# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_name
"SELECT Projects.Title, SUM(Pledges.amount) as pledge_amount
FROM Projects
INNER JOIN Pledges ON Pledges.project_id = Projects.id
GROUP BY Projects.Title
ORDER BY Projects.Title;
"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name
  #The problem here was because we were using two values in the select statement,
  #we needed to group by both of the values in the GROUP BY statement.
  #If we attempted to GROUP BY jjust one of those columns we would error out.
 "SELECT users.name, users.age, SUM(pledges.amount)
 FROM users JOIN pledges ON users.id = pledges.user_id
 GROUP BY users.name, users.age;"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
"SELECT Projects.title, SUM(Pledges.amount) - Projects.funding_goal AS 'overfunded'
FROM Projects
INNER JOIN Pledges ON Projects.id = Pledges.project_id
GROUP BY Projects.title, Projects.funding_goal
HAVING
    SUM(Pledges.amount) >= Projects.funding_goal;"
end

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount_and_users_name
#When I group by pledges_amount, it lists all of the individual pledges, so I get
#two of the same users within the list.  Ordering by creates unique user names, and
#returns the actual sum of all pledges with the same users name.
"SELECT Users.name, SUM(Pledges.amount) as pledges_amount
FROM Users
INNER JOIN Pledges ON Pledges.user_id = Users.id
GROUP BY Users.name
ORDER BY pledges_amount,  Users.name;"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
"SELECT Projects.category, Pledges.amount
FROM Pledges
INNER JOIN Projects ON Pledges.project_id = Projects.id
WHERE Projects.category LIKE 'music';"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_books_category
"SELECT Projects.category, SUM(Pledges.amount) as amount
FROM Projects
INNER JOIN Pledges ON Projects.id = Pledges.project_id
WHERE Projects.category LIKE 'books'
GROUP BY Projects.category;"
end
