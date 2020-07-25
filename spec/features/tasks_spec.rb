require 'rails_helper'
require 'support/expectations_helper'

RSpec.configure do |config|
  config.include ExpectationsHelper
end

RSpec.feature "Tasks", driver: :selenium_chrome, js: true, type: :feature do
  
  context "Tasks CRUD" do
    let!(:task) { create(:task) }

    scenario "User creates a new task" do
      visit root_path
      click_link "新增任務"
      #輸入開始與結束時間，將於步驟14補測試
      fill_in "task[title]", with: "task title"
      fill_in "task[description]", with: "task description"
      find("#task_status").find(:xpath, "option[2]").select_option
      find("#task_priority").find(:xpath, "option[2]").select_option
      click_button "新增"
      
      task = Task.last

      expect(current_path).to eq(root_path)
      expect(page).to have_text "新增成功!"
      expect_task_attributes_eq(
        task, 
        title: "task title", 
        description: "task description", 
        status: "待處理", 
        priority: "中"
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
      click_button "編輯"
      fill_in "task[title]", with: "new title"
      click_button "更新"
      task.reload

      expect(current_path).to eq(task_path(task.id))
      expect(page).to have_text "更新成功!"
      expect(page).to have_text("#{task.title}")
      expect(task.title).to eq "new title"
    end

    scenario "User deletes the task" do
      visit root_path
      task = Task.last
      find(:xpath, "//a[@href='#{task_path(task.id)}']", text: "刪除").click
      accept_alert(text: I18n.t("message.are_you_sure_to_delete", title: task.title))
  
      expect(current_path).to eq(root_path)
      expect(page).to have_text "已刪除!"
      expect(page).to have_no_xpath("//a[@href='#{task_path(task.id)}']")
      expect(Task.find_by(id: task.id)).to be_nil
    end
  end

  context "Tasks sort" do
    let!(:old_task) { create(:task, title: "old", created_at:"2020-07-25 14:00:00") }
    let!(:new_task) { create(:task, title: "new", created_at:"2020-07-26 14:00:00") }

    scenario "User sees the newest task listed on the first post" do
      visit root_path

      within "tbody tr:nth-child(1)" do
        expect(page).to have_text "new"
      end

      within "tbody tr:nth-child(2)" do
        expect(page).to have_text "old"
      end
    end
  end
end


