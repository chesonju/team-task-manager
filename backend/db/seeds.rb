company = Company.create!(name: "MyCompany")
dept = Department.create!(name: "DevDept", company: company)
team = Team.create!(name: "BackendTeam", department: dept)
user = User.create!(name: "WD", email: "wd@example.com", password_digest: "aaa", team: team, user_role: "admin")
workspace = Workspace.create!(name: "Main WS")

Task.create!(
  title: "첫 번째 태스크",
  description: "Vue 연동하기",
  status: 0,
  task_type: 1,
  user: user,
  assignee: user,
  reviewer: user,
  department: dept,
  workspace: workspace,
  start_date: Date.today,
  due_date: Date.today + 3,
  expected_end_date: Date.today + 2,
  is_completed: false
)
