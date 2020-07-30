require 'rails_helper'
require 'support/expectations_helper'

RSpec.configure do |config|
  config.include ExpectationsHelper
end

RSpec.describe "Tasks", type: :request do

  let!(:task) { create(:task) }
  
  describe 'GET #index' do
    
    it "assigns all tasks to @tasks" do
      get tasks_path
      expect(assigns(:tasks)).to eq([task])
    end
  
    it "sorts all tasks in descending order" do
      newest_task = create(:task, :newest_task)
      get tasks_path
      
      expect(assigns(:tasks).first.created_at).to eq Task.maximum("created_at")
      expect(assigns(:tasks).last.created_at).to eq Task.minimum("created_at")
    end

    it "renders the index template" do
      get tasks_path
      expect(response).to render_template("index")
    end
  end

  describe 'GET #new' do
    it 'assigns a new task to @task ' do
      get new_task_path
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let!(:task) { build(:task) }

      it 'creates a task' do
        expect {
          post tasks_path, 
          params: { task: attributes_for(:task) }
        }.to change { Task.count }.by(1)
        
        task = Task.find_by(title: "title_1", description: "description_1")
        expect_task_attributes_eq(
          task, 
          title: "title_1", 
          description: "description_1", 
          start_at: "#{ Time.zone.now }",
          end_at: "#{ Time.zone.now + 1.day}",
          status: "todo", 
          priority: "high"
        )
      end

      it 'redirects to root path' do
        post tasks_path, params: { task: attributes_for(:task) }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq("新增成功!")
      end
    end

    context 'with invalid params' do
      let!(:task) { build(:task, :invalid_params) }

      it 'should not create a task' do
        expect { 
                post tasks_path, 
                params: { task: attributes_for(:task, :invalid_params) }
              }.to change { Task.count }.by(0)
      end

      it 'renders new template' do
        post tasks_path, params:  { task: attributes_for(:task, :invalid_params) }
        expect(response).to render_template("new")
      end
    end
  end

  describe 'GET #show' do
    it "assigns a task to @task " do    
      get task_path(task)
      expect(assigns(:task)).to eq(task)
    end
  end

  describe 'GET #edit' do
    it "assigns a task to @task " do
      get edit_task_path(task)
      expect(assigns(:task)).to eq(task)
    end
  end

  describe 'PUT #update' do
    context 'with new valid params' do
      let!(:update_task) { create(:task, :update_params) }
      let!(:new_status) { Task.find(update_task.id).status }

      it 'updates one or more new attributes to @task' do      
        put task_path(update_task), params: { task: attributes_for(:task, :update_params) }
        update_task.reload
        expect(update_task.status).to eq(new_status)
      end

      it 'redirects to show template' do
        put task_path(update_task), params: { task: attributes_for(:task, :update_params) }
        expect(response).to redirect_to task_path(update_task)
        expect(flash[:notice]).to eq("更新成功!")
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes @task' do
      expect { delete task_path(task) }.to change { Task.count }.by(-1)
      expect(Task.count).to eq(0)
      
      delete_task = Task.find_by(id: task.id)
      expect(delete_task).to be_nil
    end

    it 'redirects to index template' do      
      delete task_path(task)                  
      expect(response).to redirect_to root_path
      expect(flash[:notice]).to eq("已刪除!")
    end
  end
end
