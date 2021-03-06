# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DATA = {
    muscle_keys: ["name", "information"],
    muscles: [["Trapezius (Traps)", "The trapezius is a large paired surface muscle that extends longitudinally from the occipital bone to the lower thoracic vertebrae of the spine and laterally to the spine of the scapula. It moves the scapula and supports the arm.\r\n\r\n The trapezius has three functional parts: an upper (descending) part which supports the weight of the arm; a middle region (transverse), which retracts the scapula; and a lower (ascending) part which medially rotates and depresses the scapula."],
        ["Shoulders", "The deltoid muscle is the muscle forming the rounded contour of the human shoulder. It is also known as the 'common shoulder muscle', particularly in other animals such as the domestic cat. Anatomically, it appears to be made up of three distinct sets of fibers. However, electromyography suggests that it consists of at least seven groups that can be independently coordinated by the nervous system."],
        ["Chest", "The pectoralis major (from Latin pectus 'breast') is a thick, fan-shaped muscle, situated at the chest of the human body. It makes up the bulk of the chest muscles and lies under the breast. Beneath the pectoralis major is the pectoralis minor, a thin, triangular muscle. The pectoralis major's primary functions are flexion, adduction, and internal rotation of the humerus. The pectoral major may colloquially be referred to as 'pecs', 'pectoral muscle' or 'chest muscle' due to it being the largest and most superficial muscle in the chest area."],
        ["Biceps", "The biceps (Latin: musculus biceps brachii, 'two-headed muscle of the arm', sometimes abbreviated to biceps brachii) is a large muscle that lies on the front of the upper arm between the shoulder and the elbow. Both heads of the muscle arise on the scapula and join to form a single muscle belly which is attached to the upper forearm. While the biceps crosses both the shoulder and elbow joints, its main function is at the elbow where it flexes the forearm and supinates the forearm. Both these movements are used when opening a bottle with a corkscrew: first biceps screws in the cork (supination), then it pulls the cork out (flexion)."],
        ["Forearms", "The forearm is the region of the upper limb between the elbow and the wrist. The term forearm is used in anatomy to distinguish it from the arm, a word which is most often used to describe the entire appendage of the upper limb, but which in anatomy, technically, means only the region of the upper arm, whereas the lower 'arm' is called the forearm. It is homologous to the region of the leg that lies between the knee and the ankle joints, the crus.\r\n\r\n The forearm contains two long bones, the radius and the ulna, forming the radioulnar joint. The interosseous membrane connects these bones. Ultimately, the forearm is covered by skin, the anterior surface usually being less hairy than the posterior surface."],
        ["Abdominals", "Abdominal exercises are a type of strength exercise that affect the abdominal muscles (colloquially known as the stomach muscles or 'abs'). Your abdominal consist of four muscles which are your rectus abdomens, internal oblique, external oblique, and transversus abdominis. When performing abdominal exercises it is important to understand the effects, functions, the types of exercises, and think about how to perform this exercise safely."],
        ["Quadriceps", "The quadriceps femoris muscle (also called the quadriceps extensor, quadriceps or quads) is a large muscle group that includes the four prevailing muscles on the front of the thigh.\r\n\r\n It is the great extensor muscle of the knee, forming a large fleshy mass which covers the front and sides of the femur. The name derives from Latin four-headed muscle of the femur."],
        ["Hamstrings", "In human anatomy, a hamstring is any one of the three posterior thigh muscles in between the hip and the knee (from medial to lateral: semimembranosus, semitendinosus and biceps femoris). The hamstrings are quite susceptible to injury.\r\n\r\n In quadrupeds, the hamstring is the single large tendon found behind the knee or comparable area."],
        ["Lats", "The latissimus dorsi is a large, flat muscle on the back that stretches to the sides, behind the arm, and is partly covered by the trapezius on the back near the midline. The word latissimus dorsi (plural: latissimi dorsi) comes from Latin and means 'broadest [muscle] of the back', from 'latissimus' (Latin: broadest)' and 'dorsum' (Latin: back). The pair of muscles are commonly known as 'lats', especially among bodybuilders. The latissimus dorsi is the largest muscle in the upper body.\r\n\r\n The latissimus dorsi is responsible for extension, adduction, transverse extension also known as horizontal abduction, flexion from an extended position, and (medial) internal rotation of the shoulder joint. It also has a synergistic role in extension and lateral flexion of the lumbar spine.\r\n\r\n Due to bypassing the scapulothoracic joints and attaching directly to the spine, the actions the latissimi dorsi have on moving the arms can also influence the movement of the scapulae, such as their downward rotation during a pull up."]
    ],
    exercise_keys: ["name", "information", "muscle_id"],
    exercises: [
        ["Shrug", "The lifter stands erect, hands about shoulder width apart, and slowly raises the shoulders as high as possible, and then slowly lowers them, while not bending the elbows, or moving the body at all. The lifter may not have as large a range of motion as in a normal shrug done for active flexibility. It is usually considered good form if the slope of the shoulders is horizontal in the elevated position.\r\n\r\nA barbell, dumbbells, trap bar, resistance bands or a Smith machine may be used for resistance, and overhand, inside, outside, underhand or mixed grip can be used. The barbell can be held in front of the thighs, resting on the quadriceps, or behind, resting on the hamstrings. Using these excludes inside and outside grips. One or two dumbbells or kettlebells can also be used, together or opposite one another. A trapbar can also be used, necessitating an inside grip. Standing calf raise machines can also be used to execute the shrugging movement, by resting the pads on the shoulders and trying to raise the shoulders as high as possible.", 1],
        ["Shoulder fly", "The shoulder fly (also known as a lateral raise) works the deltoid muscle of the shoulder. The movement starts with the arms straight, and the hands holding weights at the sides or in front of the body. Body is in a slight forward-leaning position with hips and knees bent a little. Arms are kept straight or slightly bent, and raised through an arc of movement in the coronal plane that terminates when the hands are at approximately shoulder height.Weights are lowered to the starting position, completing one rep. When using a cable machine the individual stands with the coronal plane in line with the pulley, which is at or near the ground. The exercise can be completed one shoulder at a time (with the other hand used to stabilize the body against the weight moved), or with both hands simultaneously if two parallel pulleys are available.", 2],
        ["Overhead press", "The overhead press (abbreviated OHP), also referred to as a shoulder press, military press, or simply the press, is a weight training exercise with many variations. It is typically performed while either standing or sitting, in which a weight is pressed straight upwards from racking position until the arms are locked out overhead, while the legs, lower back and abs maintain balance. The exercise helps build muscular shoulders with bigger arms, and is one of the most difficult compound upper-body exercises.\r\n\r\nThe overhead press is set up by taking a barbell or other weight and putting it in a racking position. This can be done by taking the weight from a rack or by cleaning the weight from the floor (clean and press). The weight is then pressed to overhead until the elbows are fully locked out. As the weight clears the head, the lifter leans forward slightly or comes directly under, in order to keep balance. As the weight is lowered back to the racking position and clears the head again, the lifter leans slightly back. The overhead press is a highly effective compound full-body exercise.", 2],
        ["Bench press", "The bench press is an upper-body weight training exercise in which the trainee presses a weight upwards while lying on a weight training bench. The exercise uses the pectoralis major, the anterior deltoids, and the triceps, among other stabilizing muscles. A barbell is generally used to hold the weight, but a pair of dumbbells can also be used.\r\n\r\nThe barbell bench press is one of three lifts in the sport of powerlifting alongside the deadlift and squat, and is the only lift in the sport of Paralympic powerlifting. It is also used extensively in weight training, bodybuilding, and other types of training to develop the chest muscles.", 3],
        ["Chest fly", "The chest fly or pectoral fly (abbreviated to pec fly) primarily works the pectoralis major muscles to move the arms horizontally forward. If medially (internally) rotated, it is assisted in this by the anterior (front) head of the deltoideus in transverse flexion. If laterally (externally) rotated, the contribution of the deltoid is lessened and the pec major is strongly emphasized as the transverse adductor.\r\n\r\nThe hands are usually brought out further than the elbows, in which case the flexors contract isometrically to inhibit undesired excess extension of the elbow. Muscles which do this are the biceps brachii, the brachialis and the brachioradialis. The biceps may also play a limited role in shoulder flexion. The straighter the elbow is, the more stretch in these muscles. For safety, many avoid locking out the joint.", 3],
        ["Press-up", "A press-up (or push-up in American English) is a common calisthenics exercise beginning from the prone position. By raising and lowering the body using the arms, press-ups exercise the pectoral muscles, triceps, and anterior deltoids, with ancillary benefits to the rest of the deltoids, serratus anterior, coracobrachialis and the midsection as a whole. Press-ups are a basic exercise used in civilian athletic training or physical education and commonly in military physical training. They are also a common form of punishment used in the military, school sport, and some martial arts disciplines.", 3],
        ["Dip", "A dip is an upper-body strength exercise. Narrow, shoulder-width dips primarily train the triceps, with major synergists being the anterior deltoid, the pectoralis muscles (sternal, clavicular, and minor), and the rhomboid muscles of the back (in that order). Wide arm training places additional emphasis on the pectoral muscles, similar in respect to the way a wide grip bench press would focus more on the pectorals and less on the triceps.", 3],
        ["Biceps curl", "Biceps curl is a general term for a series of strength exercises that involve brachioradialis, front deltoid and the main target on biceps brachii. Includes variations using barbell, dumbbell and resistance band, etc. The common point amongst them is the trainee lifting a certain amount of weight to contracting the biceps brachii, and tuck in their arms to the torso during the concentric phase. Once the biceps brachii is fully contracted, then return the weight to starting position during the eccentric phase.", 4],
        ["Chin-up", "The chin-up (also known as a chin or chinup) is a strength training exercise. People frequently do this exercise with the intention of strengthening muscles such as the latissimus dorsi and biceps, which extend the shoulder and flex the elbow, respectively. In this maneuver, the palms are faced towards the body.", 4],
        ["Wrist curl", "The wrist curl is a weight training exercise for developing just the wrist flexor muscles of the forearm. It is therefore an isolation exercise. Ideally, it should be done in combination with the 'reverse wrist curl' (also called wrist extension) to ensure equal development of the wrist flexor and wrist extensor muscles.\r\n\r\nWrist curls can be performed with a dumbbell or with both hands holding a barbell. To perform a seated wrist curl, the lifter should be seated on a bench with knees bent and the forearm(s) resting on the thigh, or with forearms on a bench and hands hanging off the edge. The palm should be facing up and the hand should be free to move completely up and down. At the starting point, the wrist should be bent back so that the fingers are almost pointing down at the floor. In a steady motion, the lifter should raise the weight by using the forearm muscles to bring the hand up as far as possible. The forearm itself should remain resting on the thigh. Then the weight should be slowly lowered back down to the starting point.", 5],
        ["Crunch", "The crunch is one of the most popular abdominal exercises. When performed properly, it engages all the abdominal muscles but primarily it works the rectus abdominis muscle and the obliques. It allows both building six-pack abs, and tightening the belly. Crunches use the exerciser's own body weight to tone muscle, and are recommended as a low-cost exercise that can be performed at home.", 6],
        ["Leg raise", "The leg raise is a strength training exercise which targets the iliopsoas (the anterior hip flexors). Because the abdominal muscles are used isometrically to stabilize the body during the motion, leg raises are also often used to strengthen the rectus abdominis muscle and the internal and external oblique muscles.", 6],
        ["Russian twist", "The Russian twist is a simple abdominal exercise for working the core, shoulders, and hips. It is typically performed in repetitive sets and tones the core muscles via a twisting motion focused around the abdomen. The exercise can help build strength in the upper torso, which may help in sports such as tennis, swimming, baseball, track & field, hockey, golf, lacrosse, or boxing. Additionally, there are many variations of the Russian twist that can be used to intensify a workout routine.", 6],
        ["Deadlift", "The deadlift is a weight training exercise in which a loaded barbell or bar is lifted off the ground to the level of the hips, torso perpendicular to the floor, before being placed back on the ground. It is one of the three powerlifting exercises, along with the squat and bench press.", 7],
        ["Squat", "A squat is a strength exercise in which the trainee lowers their hips from a standing position and then stands back up. During the descent of a squat, the hip and knee joints flex while the ankle joint dorsiflexes; conversely the hip and knee joints extend and the ankle joint plantarflexes when standing up.\r\n\r\nSquats are considered a vital exercise for increasing the strength and size of the lower body muscles as well as developing core strength. The primary agonist muscles used during the squat are the quadriceps femoris, the adductor magnus, and the gluteus maximus. The squat also isometrically uses the erector spinae and the abdominal muscles, among others.\r\n\r\n The squat is one of the three lifts in the strength sport of powerlifting, together with the deadlift and the bench press. It is also considered a staple exercise in many popular recreational exercise programs.", 7],
        ["Leg curl", "The leg curl, also known as the hamstring curl, is an isolation exercise that targets the hamstring muscles. The exercise involves flexing the lower leg against resistance towards the buttocks. There are three types of leg curls. There are seated leg curls, laying leg curls, and standing leg curls.", 8],
        ["Bent-over row", "A bent-over row (or barbell row) is a weight training exercise that targets a variety of back muscles. Which ones are targeted varies on form. The bent over row is often used for both bodybuilding and powerlifting. It is a good exercise for increasing strength and size.", 9],
        ["Pull-up", "A pull-up is an upper-body strength exercise. The pull-up is a closed-chain movement where the body is suspended by the hands and pulls up. As this happens, the elbows flex and the shoulders adduct and extend to bring the elbows to the torso.\r\n\r\nThe term chin-up, traditionally referring to a pull-up with the chin brought over the top of a bar, was used in the 1980s to refer to a pronated, or overhand, grip, with a supinated, or underhand, grip being called a 'reverse-grip' chin-up. In later decades, this usage has inverted, with some using 'chin-up' to refer to a pull-up done with a supinated hand position, while 'pull-up' refers specifically to the exercise done with a pronated hand position.\r\n\r\n Pull-ups use many different muscles of the upper body, including the latissimus dorsi and the biceps brachii.", 9]
    ]
}

USERS = [
    "John Smith",
    "Owen Jones",
    "Mark Wilson",
    "Sam Piper",
    "Tony Watson",
    "Seamus Austin",
    "Peter Hamill",
    "Paul Newman",
    "Jane Taylor",
    "Stacy Foster",
    "Mary Johnson",
    "Elizabeth Walker",
    "Annie Potter",
    "Pauline Hooper",
    "Jennifer Hamilton",
    "Roger Taylor",
    "Suzanne Jackson",
    "Danny Jackobs"
]

BIOS = [
    "Gym junkie.",
    "Live for the deadlifts.",
    "Everyday is leg day.",
    "UK Based.",
    "Everyone needs a tune-up.",
    "No pain No gain.",
    "It’s never too late to feel great.",
    "Light weight, yeah buddy.",
    "Strength does not come from winning. Your struggles develop your strengths.",
    "Failure is not an option. Everyone has to succeed.",
    "We all have great inner power. The power is self-faith.",
    "There are no shortcuts.",
    "The hardest part is walking out the front door.",
    "Ain't nothin' but a peanut.",
    "If you always do what you’ve always done..you’ll always get what you always got.",
    "Aspiring bodybuilder.",
    "Push harder than yesterday if you want a different tomorrow.",
    "Fitness is not a destination it is a way of life.",
    "Crossfit is life."
]

WORKOUT_START = [
    "Killer",
    "Ultimate",
    "Professional",
    "Serious",
    "Any-time",
    "Low-impact",
    "Recovery",
    "Monster",
    "Quick",
    "High intensity",
    "Weekend"
]

WORKOUT_MIDDLE = [
    "Full Body",
    "Stamina",
    "Leg",
    "Strength",
    "Abs",
    "Booty",
    "Mobility",
    "Fitness",
    "Cardio",
    "Interval"
]

WORKOUT_END = [
    "Buster",
    "Burner",
    "Obliterator",
    "Trainer",
    "Workout",
    "Crusher",
    "Blast",
    "Blaster",
    "Routine",
    "Boot Camp",
    "Circuits"
]

def make_admin
    User.create(username: "Admin", email: "admin@admin.com", password: "admin", admin: true)
end

def make_users
    USERS.each do |user|
        params = {}
        username = user.split.collect.with_index{|n,i| i == 0 ? n[0] : n}.join
        params[:username] = username
        params[:name] = user
        params[:email] = username + "@email.com"
        params[:password] = username
        
        rng = rand(1..10)
        if rng == 1
            params[:admin] = true
        elsif rng < 4
            params[:admin_requested] = "1"
        end

        bio = BIOS.sample(rand(2..5)).join(" ")

        params[:bio] = bio

        User.create(params)
    end
end

def make_workouts
    User.all.each do |user|
        rand(4..10).times do
            title = [WORKOUT_START.sample, WORKOUT_MIDDLE.sample, WORKOUT_END.sample].join(" ")
            information = "placeholder"
            workout = user.workouts.create(name: title, information: information)
            rand(3..6).times do
                workout.workout_exercises.create(exercise: @exercise.sample, sets: rand(1..5), reps: rand(1..20)) if workout
            end
            make_workout_information(workout)
        end
    end
end

FILL_ONE = [
    "maximise",
    "enhance",
    "recover",
    "build",
    "train",
    "magnify",
    "improve",
    "boost"
]

FILL_TWO = [
    "performance",
    "ability",
    "productivity",
    "gains",
    "output",
    "work rate"
]

def make_workout_information(workout)
    workout.update(information: (["This", workout.name, "is designed to", FILL_ONE.sample, FILL_TWO.sample, "through training "].join(" ") + workout.workout_exercises.collect{|we| we.exercise.name }.join(", ").gsub(/.*\K,/, ', and') + "."))
end

def star_workouts
    @workouts = Workout.all
    User.all.each do |user|
        @workouts.sample(@workouts.size/rand(3..6)).each do |workout|
            user.stars.create(starable: workout)
        end
    end
end

def predate_workouts
    Workout.all.each do |workout|
        workout.created_at -= rand(1..1000000)
        workout.save
    end
end

def predate_users
    User.all.each do |user|
        user.created_at = user.workouts.order(:created_at).limit(1).first.created_at - 1000
        user.save
    end
end

def make_muscles
    DATA[:muscles].each do |muscle|
        new_muscle = Muscle.new
        muscle.each_with_index do |attribute, i|
            new_muscle.send(DATA[:muscle_keys][i]+"=", attribute)
        end
        new_muscle.save
    end
end

def make_exercises
    DATA[:exercises].each do |exercise|
        new_exercise = Exercise.new
        exercise.each_with_index do |attribute, i|
            new_exercise.send(DATA[:exercise_keys][i]+"=", attribute)
        end
        new_exercise.save
    end
end

def main
    @exercise = Exercise.all
    make_muscles
    make_exercises
    make_users
    make_admin
    make_workouts
    star_workouts
    predate_workouts
    predate_users
end

main