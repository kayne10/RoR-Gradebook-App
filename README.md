# Gradebook Application

After taking upon the challenge to make this application and picking up a new framework, I am now a big fan of Ruby on Rails.

### Start the application from scratch
`bundle && rake db:migrate && rails server`
<br />

If you want to seed the database use <br />
`rake db:reset && rake db:seed`<br />

I will warn you that some constraints fail in the seed. User, grade, and enrollment models do not get seeded into the database. However, the seed file is a perfect place to find sample data for manually adding data. I recommend inputting in the order of the seed file.

<br />

(students->teachers->admin->semesters->courses->grades->enrollments)

<br />

You can add them with `rails console` or with the web interface.

### Relational Database Design

<img src="ER-Diagram.png" />

### Significant joins

Teacher gets a list of students with grades for a given course. <br />
`User.joins(enrollment: [{course: :grade}]).where('courses.user_id'=>current_user).distinct`
<br />
In SQL: <br />
`"SELECT DISTINCT \"users\".* FROM \"users\" INNER JOIN \"enrollments\" ON \"enrollments\".\"user_id\" = \"users\".\"id\" INNER JOIN \"courses\" ON \"courses\".\"id\" = \"enrollments\".\"course_id\" INNER JOIN \"grades\" ON \"grades\".\"course_id\" = \"courses\".\"id\" WHERE (courses.user_id=5)"`
<br />
Student sees courses and corresponding grades he is registered with.
`User.joins(grade: :course).where('users.id'=>current_user).distinct`
<br />
In SQL: <br />
`"SELECT DISTINCT \"users\".* FROM \"users\" INNER JOIN \"grades\" ON \"grades\".\"user_id\" = \"users\".\"id\" INNER JOIN \"courses\" ON \"courses\".\"id\" = \"grades\".\"course_id\" WHERE (users.id=1)"`
<br />
Teacher views student roster and corresponding grades for a given course. <br />
`User.joins(grade: :course).where('courses.id'=> @course.id).distinct` <br />
In SQL: <br />
`"SELECT DISTINCT \"users\".* FROM \"users\" INNER JOIN \"grades\" ON \"grades\".\"user_id\" = \"users\".\"id\" INNER JOIN \"courses\" ON \"courses\".\"id\" = \"grades\".\"course_id\" WHERE (courses.id=1)"` <br />
Administrator views enrollment count for all courses in a given semester. <br/>
`Semester.joins(enrollment: :course).distinct` <br />
In SQL: <br />
`"SELECT DISTINCT \"semesters\".* FROM \"semesters\" INNER JOIN \"enrollments\" ON \"enrollments\".\"semester_id\" = \"semesters\".\"id\" INNER JOIN \"courses\" ON \"courses\".\"id\" = \"enrollments\".\"course_id\""` <br />
Administrator has access to get average gpa for all courses <br />
`Course.joins(:grade).distinct` <br />
In SQL: <br />
`SELECT DISTINCT \"courses\".* FROM \"courses\" INNER JOIN \"grades\" ON \"grades\".\"course_id\" = \"courses\".\"id\""` <br />

###Challenges

It took me awhile for accessing joins with templates. That was difficult. Even though this is mostly a front end issue, I would like to know best practice on accessing association attributes with the ORM. Overall. I enjoyed picking up Ruby on Rails. It makes implementing REST APIs that communicate with relational databases very convenient.
