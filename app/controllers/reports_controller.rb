class ReportsController < ApplicationController
  
  def index
    
    #start fresh
    User.destroy_all
    Email.destroy_all
    Group.destroy_all
    User.init_user_table
    
    #gather data to show
    @all_groups = Group.all.to_json
    @group_to_search = "Protagonists"
    @users_in_group = User.find_user_ids_in_group(@group_to_search)
    @emails_in_group = Email.get_array_emails(@users_in_group)
    
    #enable getting the list of emails as json
    respond_to do |format|  
        format.html # index.html.erb  
        format.json  { render :json => @emails_in_group }  
    end  
    
  end
  
end
