require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  let!(:task) {
                Task.create(
                            {
                              title:'寫測試', 
                              description:'寫新增任務測試', 
                              status: '待處理',
                              priority: '高',
                              start_at: '2020-06-25 00:44:00',
                              end_at: '2020-06-26 00:44:00',
                              deleted_at: nil
                            }
                          )    
              }
  
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
      before(:each) do
                @valid_task_params = { 
                              task: 
                                {
                                  title:'寫測試', 
                                  description:'寫新增任務測試', 
                                  status: '待處理',
                                  priority: '高',
                                  start_at: '2020-06-25 00:44:00',
                                  end_at: '2020-06-26 00:44:00'
                                }
                            } 
      end

      it 'should create a task' do

        expect {
                post tasks_path, 
                params: @valid_task_params
               }.to change { Task.count }.by(1)                 
      end

      it 'should redirect to root path' do

        post tasks_path, params: @valid_task_params            

        expect(response).to redirect_to root_path
        expect(flash[:notice]).to eq '新增成功!'
      end
    end

    context 'with invalid params' do
      before(:each) do
        @invalid_task_params = { 
                      task: 
                        {
                          title:nil, 
                          description:'寫新增任務測試', 
                          status: '待處理',
                          priority: '高',
                          start_at: '2020-06-25 00:44:00',
                          end_at: '2020-06-26 00:44:00'
                        }
                    } 
      end

      it 'should not create a task' do

        expect { 
                post tasks_path, 
                params: @invalid_task_params
              }.to change { Task.count }.by(0)
      end

      it 'should render edit template' do

        post tasks_path, params: @invalid_task_params
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
      before(:each) do
        @new_valid_params = 
                          { 
                            task: { status: '處理中' }
                          }  
      end

      it 'should update one or more new attributes to @task' do                        
        
        put task_path(task), params: @new_valid_params
        task.reload

        expect(task.status).to eq @new_valid_params[:task][:status]
      end

      it 'should redirect to show template' do

        put task_path(task), params: @new_valid_params          

        expect(response).to redirect_to task_path(task)
        expect(flash[:notice]).to eq '更新成功!'
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'should delete @task' do

      expect { delete task_path(task) }.to change { Task.count }.by(-1)
    end

    it 'should redirect to index template' do
      
      delete task_path(task)                  

      expect(response).to redirect_to root_path
      expect(flash[:notice]).to eq '已刪除!'
    end
  end
end
