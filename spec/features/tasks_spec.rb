require 'rails_helper'

RSpec.feature "Tasks", driver: :selenium_chrome, js: true, type: :feature do
  let(:task) { FactoryBot.create(:task) }
  scenario "User creates a new task" do
    visit root_path
    click_link '新增任務'

    #輸入開始與結束時間，待補測試
    fill_in 'task[title]', with: 'task title'
    fill_in 'task[description]', with: 'task description'
    find('#task_status').find(:xpath, 'option[2]').select_option
    find('#task_priority').find(:xpath, 'option[2]').select_option
    click_button '新增'
    
    task = Task.last

    expect(current_url) == root_path
    expect(page).to have_text '新增成功!'
    expect(task.title).to eq 'task title'
    expect(task.description).to eq 'task description'
    expect(task.status).to eq '待處理'
    expect(task.priority).to eq '中'
  end
end

