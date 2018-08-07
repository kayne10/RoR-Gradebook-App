# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = User.create(
  [
    {
      id: 1,
      name: 'Troy Kayne',
      email: 'troy.kayne@colorado.edu',
      student: true,
      teacher: false,
      admin: false,
      password_digest: 'student123'
    },
    {
      id: 2,
      name: 'Luke Skywalker',
      email: 'luke.skywalker@gmail.com',
      student: true,
      teacher: false,
      admin: false,
      password_digest: 'student123'
    },
    {
      id:3,
      name: 'Tony Stark',
      email: 'tony.stark@gmail.com',
      student: true,
      teacher: false,
      admin: false,
      password_digest: 'student123'
    },
    {
      id:4,
      name: 'Bruce Banner',
      email: 'bruce.banner@gmail.com',
      student: true,
      teacher: false,
      admin: false,
      password_digest: 'student123'
    },
    {
      id:5,
      name: 'Steven Rogers',
      email: 'steven.rogers@gmail.com',
      student: true,
      teacher: false,
      admin: false,
      password_digest: 'student123'
    }
  ]
)

teachers = User.create(
  [
    {
      id:6,
      name: 'Mr. Kayne',
      email: 'tkayne10@gmail.com',
      student: false,
      teacher: true,
      admin: false,
      password_digest: 'teacher123'
    },
    {
      id:7,
      name: 'Mr. Frank',
      email: 'frank@gmail.com',
      student: false,
      teacher: true,
      admin: false,
      password_digest: 'teacher123'
    }
  ]
)
# admin
User.create(id:8, name:'Admin', email:'admin@gmail.com', student:false, teacher:false, admin:true, password_digest:'admin123')

semesters = Semester.create(
  [
    {
      id:1,
      title: 'Fall2017'
    },
    {
      id:2,
      title: 'Spring2018'
    },
    {
      id:3,
      title: 'Fall2018'
    }
  ]
)

courses = Course.create(
  [
    {
      id:1,
      user_id: 6,
      title: 'Web Development',
      start_date: Time.now,
      end_date: Time.now,
      semester_id: 1
    },
    {
      id:2,
      user_id: 6,
      title: 'DevOps',
      start_date: Time.now,
      end_date: Time.now,
      semester_id: 2
    },
    {
      id:3,
      user_id: 6,
      title: 'Machine Learning',
      start_date: Time.now,
      end_date: Time.now,
      semester_id: 3
    },
    {
      id:4,
      user_id: 7,
      title: 'Physics 1',
      start_date: Time.now,
      end_date: Time.now,
      semester_id: 1
    },
    {
      id:5,
      user_id: 7,
      title: 'Physics 2',
      start_date: Time.now,
      end_date: Time.now,
      semester_id: 2
    },
    {
      id:6,
      user_id: 7,
      title: 'Physics 3',
      start_date: Time.now,
      end_date: Time.now,
      semester_id: 3
    }
  ]
)

# grades
grades = Grade.create(
  [
    {
      id:1,
      user_id:1,
      course_id:1,
      grade_value:4
    },
    {
      id:2,
      user_id:1,
      course_id:2,
      grade_value:2
    },
    {
      id:3,
      user_id:1,
      course_id:3,
      grade_value:3
    },
    {
      id:4,
      user_id:1,
      course_id:5,
      grade_value:4
    },
    {
      id:5,
      user_id:2,
      course_id:1,
      grade_value:3
    },
    {
      id:6,
      user_id:2,
      course_id:6,
      grade_value:4
    },
    {
      id:7,
      user_id:3,
      course_id:2,
      grade_value:2
    },
    {
      id:8,
      user_id:3,
      course_id:6,
      grade_value:3
    },
    {
      id:9,
      user_id:4,
      course_id:5,
      grade_value:4
    },
    {
      id:10,
      user_id:4,
      course_id:2,
      grade_value:2,
    },
    {
      id:11,
      user_id:5,
      course_id:3,
      grade_value:3
    },
    {
      id:12,
      user_id:5,
      course_id:4,
      grade_value:4
    },
    {
      id:13,
      user_id:5,
      course_id:1,
      grade_value:1
    }
  ]
)

# enrollments
enrollments = Enrollment.create(
  [
    {
      id:1,
      user_id:1,
      course_id:1,
      semester_id:1
    },
    {
      id:2,
      user_id:1,
      course_id:2,
      semester_id:2
    },
    {
      id:3,
      user_id:1,
      course_id:3,
      semester_id:3
    },
    {
      id:4,
      user_id:1,
      course_id:5,
      semester_id:2
    },
    {
      id:5,
      user_id:2,
      course_id:1,
      semester_id:1
    },
    {
      id:6,
      user_id:2,
      course_id:6,
      semester_id:3
    },
    {
      id:7,
      user_id:3,
      course_id:2,
      semester_id:2
    },
    {
      id:8,
      user_id:3,
      course_id:6,
      semester_id:3
    },
    {
      id:9,
      user_id:4,
      course_id:5,
      semester_id:2
    },
    {
      id:10,
      user_id:4,
      course_id:2,
      semester_id:2,
    },
    {
      id:11,
      user_id:5,
      course_id:3,
      semester_id:3
    },
    {
      id:12,
      user_id:5,
      course_id:4,
      semester_id:2
    },
    {
      id:13,
      user_id:5,
      course_id:1,
      semester_id:1
    }
  ]
)
