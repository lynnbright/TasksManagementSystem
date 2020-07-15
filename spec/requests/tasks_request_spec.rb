require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  let!(:task) { FactoryBot.create(:task) }   
  
  describe 'GET #index' do
    it "should assign all tasks to @tasks" do
        get tasks_path
        expect(assigns(:tasks)).to eq [task]
    end

    it "should render the index template" do
      get tasks_path
      expect(response).to render_template("index")
    end
  end

  describe 'GET #new' do
    it 'should assign a new task to @task ' do
      get new_task_path
      expect(assigns(:task)).to be_a_new(Task)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      let!(:task) { FactoryBot.build(:task) }

      it 'should create a task' do
        expect {
                  post tasks_path, 
                  params: { task: attributes_for(:task) }
               }.to change { Task.count }.by(1)                 
      end

      it 'should redirect to root path' do
        post tasks_path, params: { task: attributes_for(:task) }
        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq '新增成功!'
      end
    end

    context 'with invalid params' do
      let!(:task) { FactoryBot.build(:task, :invalid_params) }

      it 'should not create a task' do
        expect { 
                post tasks_path, 
                params: { task: attributes_for(:task, :invalid_params) }
              }.to change { Task.count }.by(0)
      end

      it 'should render edit template' do
        post tasks_path, params:  { task: attributes_for(:task, :invalid_params) }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'GET #show' do
    it "should assign a task to @task " do    
      get task_path(task)
      expect(assigns(:task)).to eq task
    end
  end

  describe 'GET #edit' do
    it "should assign a task to @task " do
      get edit_task_path(task)
      expect(assigns(:task)).to eq task
    end
  end

  describe 'PUT #update' do
    context 'with new valid params' do
      let!(:update_task) { FactoryBot.create(:task, :update_params) }
      let!(:new_status) { Task.find(update_task.id).status }

      it 'should update one or more new attributes to @task' do      
        put task_path(update_task), params: { task: attributes_for(:task, :update_params) }
        update_task.reload
        expect(update_task.status).to eq new_status
      end

      it 'should redirect to show template' do
        put task_path(update_task), params: { task: attributes_for(:task, :update_params) }
        expect(response).to redirect_to task_path(update_task)
        expect(flash[:notice]).to eq '更新成功!'
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete @task' do
      expect { delete task_path(task) }.to change { Task.count }.by(-1)
      expect(Task.count).to eq(0)
    end

    it 'should redirect to index template' do      
      delete task_path(task)                  
      expect(response).to redirect_to root_path
      expect(flash[:notice]).to eq '已刪除!'
    end
  end
end
