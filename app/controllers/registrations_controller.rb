class RegistrationsController < Devise::RegistrationsController


    def destroy
        files = User.find(resource.id).posts
        files.destroy_all
        resource.destroy
        set_flash_message :notice, :destroyed
        redirect_to root_path, status: :see_other
        #redirect_to action: 'index', status: 303
        
      
    end
    private

    

    def after_sign_up_path_for(resource)
        root_path # or any other path
    end
    def after_registration_path(resource)
        root_path
    end
        

    def sign_up_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end
    def acount_update_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password)
    end
end