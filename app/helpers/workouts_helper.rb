module WorkoutsHelper
    def workout_index_title
        if current_uri =~ /starred_workouts\z/
            "Workouts starred by #{@user.username}"
        else
            @user ? "All workouts created by #{@user.username}" : "All workouts"
        end
    end
end
