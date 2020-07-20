require 'rails_helper'

RSpec.feature "Tasks", driver: :selenium_chrome, js: true, type: :feature do
  
  let(:task) { create(:task) }
  
  scenario "User creates a new task" do
    visit root_path
    click_link '新增任務'
    #輸入開始與結束時間，將於步驟14補測試
    fill_in 'task[title]', with: 'task title'
    fill_in 'task[description]', with: 'task description'
    find('#task_status').find(:xpath, 'option[2]').select_option
    find('#task_priority').find(:xpath, 'option[2]').select_option
    click_button '新增'
    
    task = Task.last

    expect(current_url) == root_path
    expect(page).to have_text '新增成功!'
    expect_task_attributes_eq(
      task, 
      title: 'task title', 
      description: 'task description', 
      status: '待處理', 
      priority: '中'
    )
  end

  scenario "User reads the task" do
    visit root_path
    task = Task.last
    find(:xpath, "//a[@href='#{task_path(task.id)}']", text: "#{task.title}").click

    expect_task_contents_eq(
      task, 
      title: "#{task.title}", 
      description: "#{task.description}", 
      start_at: "#{task.start_at}", 
      end_at: "#{task.end_at}", 
      status: "#{task.status}", 
      priority: "#{task.priority}" 
    )
  end

  scenario "User updates the task" do
    task = Task.last
    visit task_path(task.id)
    click_button '編輯'
    fill_in 'task[title]', with: 'new title'
    click_button '更新'
    task.reload

    expect(current_url) == task_path(task.id)
    expect(page).to have_text '更新成功!'
    expect(page).to have_text("#{task.title}")
  end

  scenario "User deletes the task" do
    visit root_path
    task = Task.last
    find(:xpath, "//a[@href='#{task_path(task.id)}']", text: "刪除").click
    accept_alert(text: 'Are you sure?') 

    expect(current_url) == root_path
    expect(page).to have_text '已刪除!'
    expect(page).to have_no_xpath("//a[@href='#{task_path(task.id)}']")
  end
end

private
def expect_task_attributes_eq(task, values = {})
  values.each do |k, v|
    task_value = task.try(k.to_sym)
    expect(task_value).to eq(v)
  end
end

def expect_task_contents_eq(task, values = {})
  values.each do |k, v|
    view_task_contents = task.try(k.to_sym)
    expect(view_task_contents).to have_text(v)
  end
end

