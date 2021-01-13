module ExercisesHelper
    def exercise_show_title
        @muscle ? "Exercises for #{@muscle.name}" : "All exercises"
    end

    def new_exercise_link
        if @muscle
            button_to "Add a new exercise", new_muscle_exercise_path(@muscle), method: :get
        else
            button_to "Add a new exercise", new_exercise_path, method: :get
        end
    end
end
