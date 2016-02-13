class ProjectsController < ApplicationController
  def list
    projects = Project.take!
    response.headers['Content-Type'] = 'application/json'
    render :json => projects , except:[:created_at, :updated_at] , status: :ok
  end

  def create
    project = Project.new
    project.title = params['title']
    project.description = params['description']
    project.url = params['url']

    if project.title == nil or project.description == nil
      head :bad_request
    else
      project.save
      response.headers['Content-Type'] = 'application/json'
      render :json => project , except:[:created_at, :updated_at] , status: :ok # status: :created
    end
  end

  def get
    project = Project.find_by(id: params["id"].to_i)
    if project then
      response.headers['Content-Type'] = 'application/json'
      render :json => project , except:[:created_at, :updated_at] , status: :ok
    else
      head 404
    end
  end

  def delete
    project = Project.find_by(id: params["id"].to_i)

    if project then 
      project.destroy
      response.headers['Content-Type'] = 'application/json'
      render :json => project , except:[:created_at, :updated_at] , status: :ok
    else
      head 404
    end
  end
end
