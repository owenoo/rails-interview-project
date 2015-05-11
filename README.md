# Fun with Rails Associations
A sample Rails project

Given the following structure:

    Table: Groups [id, name, user_id]
    Table: Users [id, name, group_id]
    Table: Emails [id, address, user_id]
    Controller: ReportsController

The project website displays the list of all emails belonging to a preselected Group, configured server-side.  To see the results, pull down this repo locally and start your rails server.  Navigate to localhost:3000 and you will be brought directly to the index action of the Report Controller.  If you want to see just the emails as a JSON object, you can navigate to http://localhost:3000/reports.json

Testing was done with RSpec for the methods in the User and Email models.  There's some very basic testing for the ReportsController also.