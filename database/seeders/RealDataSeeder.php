<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Models\Category;
use App\Models\SubCategory;
use App\Models\User;
use App\Models\Course;
use App\Models\CourseSection;
use App\Models\CourseLecture;
use App\Models\CourseGoal;
use App\Models\CourseMaterial;
use App\Models\CourseQuestion;
use App\Models\Quiz;
use App\Models\QuizQuestion;
use App\Models\Review;
use App\Models\Coupon;
use App\Models\Slider;
use App\Models\InfoBox;
use App\Models\Partner;
use App\Models\SiteInfo;
use App\Models\Payment;
use App\Models\Order;
use App\Models\Enrollment;
use Faker\Factory as Faker;

class RealDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        // Clear existing data to ensure exact counts
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        Course::truncate();
        CourseSection::truncate();
        CourseLecture::truncate();
        CourseGoal::truncate();
        CourseMaterial::truncate();
        CourseQuestion::truncate();
        Quiz::truncate();
        QuizQuestion::truncate();
        Review::truncate();
        Coupon::truncate();
        Payment::truncate();
        Order::truncate();
        Enrollment::truncate();
        Category::truncate();
        SubCategory::truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');

        // 1. Users (Instructors and Students)
        $instructors = [];
        for ($i = 1; $i <= 5; $i++) {
            $user = User::updateOrCreate([
                'email' => 'instructor' . $i . '@example.com'
            ], [
                'name' => 'Instructor ' . $i,
                'password' => Hash::make('password'),
                'role' => 'instructor',
                'status' => '1',
                'phone' => $faker->phoneNumber,
                'address' => $faker->address,
                'bio' => $faker->paragraph,
                'experience' => '5+ years experience in teaching ' . $faker->jobTitle,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
            $user->assignRole('instructor');
            $instructors[] = $user;
        }

        $students = [];
        for ($i = 1; $i <= 10; $i++) {
            $user = User::updateOrCreate([
                'email' => 'student' . $i . '@example.com'
            ], [
                'name' => 'Student ' . $i,
                'password' => Hash::make('password'),
                'role' => 'user',
                'status' => '1',
                'phone' => $faker->phoneNumber,
                'address' => $faker->address,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
            $user->assignRole('user');
            $students[] = $user;
        }

        // 2. Categories & Subcategories
        $categories_data = [
            'Web Development' => ['React', 'Laravel', 'Node.js', 'Vue.js'],
            'Mobile Development' => ['Flutter', 'React Native', 'Swift', 'Kotlin'],
            'Design' => ['UI/UX', 'Graphic Design', 'Figma', 'Photoshop'],
            'Business' => ['Finance', 'Marketing', 'Entrepreneurship', 'Management'],
            'IT & Software' => ['Cyber Security', 'Cloud Computing', 'Data Science', 'Python'],
        ];

        $all_subcategories = [];
        foreach ($categories_data as $cat_name => $subs) {
            $category = Category::updateOrCreate([
                'slug' => Str::slug($cat_name)
            ], [
                'name' => $cat_name,
                'image' => 'upload/category/cat_' . strtolower(str_replace(' ', '_', $cat_name)) . '.png',
            ]);

            foreach ($subs as $sub_name) {
                $all_subcategories[] = SubCategory::updateOrCreate([
                    'slug' => Str::slug($sub_name)
                ], [
                    'category_id' => $category->id,
                    'name' => $sub_name,
                ]);
            }
        }

        // 3. Courses, Sections, Lectures, Goals, Quizzes, Materials, Questions
        $review_comments_good = [
            'Excellent course! Very clear and easy to follow.',
            'Best investment I have made this year. Highly recommended.',
            'The instructor is very knowledgeable and the content is top-notch.',
            'I learned so much in just a few days. Great pace!',
            'Perfect for beginners. The examples are very helpful.',
            'Amazing quality. The production value is great.',
            'Clear explanations and very practical assignments.',
            'Loved the live sessions. They really helped clear my doubts.'
        ];

        $review_comments_bad = [
            'The pacing was a bit slow for me.',
            'I wish there were more advanced examples.',
            'The audio quality could be improved in some sections.',
            'Some topics felt a bit rushed.',
            'The quiz questions were a bit confusing.',
            'I had some trouble accessing the materials at first.',
        ];

        $topic_videos = [
            'React' => 'https://www.youtube.com/watch?v=SqcY0GlTLPk',
            'Laravel' => 'https://www.youtube.com/watch?v=MYyJ4PuL4pY',
            'Node.js' => 'https://www.youtube.com/watch?v=fBNz5xF-Kx4',
            'Vue.js' => 'https://www.youtube.com/watch?v=qZXt1Aom3Cs',
            'Flutter' => 'https://www.youtube.com/watch?v=VPvVD8t02U8',
            'UI/UX' => 'https://www.youtube.com/watch?v=c9Wg6mBaeT8',
            'Python' => 'https://www.youtube.com/watch?v=_uQrJ0TkZlc',
            'Cyber Security' => 'https://www.youtube.com/watch?v=U_P2fR1S94s',
            'Figma' => 'https://www.youtube.com/watch?v=jk1T6BaJiOE',
            'Data Science' => 'https://www.youtube.com/watch?v=ua-CiDNNj30',
            'Swift' => 'https://www.youtube.com/watch?v=FcsY1YPBwzQ',
            'Marketing' => 'https://www.youtube.com/watch?v=l_8p92w8z7Y',
            'Cloud Computing' => 'https://www.youtube.com/watch?v=M988_fsOSWo',
        ];

        foreach ($instructors as $instructor) {
            // Create 3 Coupons for each instructor
            for ($c = 1; $c <= 3; $c++) {
                Coupon::updateOrCreate([
                    'coupon_name' => 'INS' . $instructor->id . 'OFF' . ($c * 5)
                ], [
                    'instructor_id' => $instructor->id,
                    'coupon_discount' => ($c * 5),
                    'coupon_validity' => now()->addDays(30)->format('Y-m-d'),
                    'status' => 1,
                ]);
            }

            // Create 5 Courses for each instructor
            for ($i = 1; $i <= 5; $i++) {
                $subcategory = $all_subcategories[array_rand($all_subcategories)];
                $course_name = $subcategory->name . ' - Masterclass by ' . $instructor->name . ' (Vol ' . $i . ')';
                $yt_link = $topic_videos[$subcategory->name] ?? 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
                
                $course = Course::updateOrCreate([
                    'course_name_slug' => Str::slug($course_name)
                ], [
                    'category_id' => $subcategory->category_id,
                    'subcategory_id' => $subcategory->id,
                    'instructor_id' => $instructor->id,
                    'course_title' => $course_name,
                    'course_name' => $course_name,
                    'course_image' => 'upload/course/course_' . rand(1, 10) . '.png',
                    'description' => $faker->paragraphs(3, true),
                    'video_url' => $yt_link,
                    'label' => ($i % 2 == 0) ? 'Bestseller' : 'Featured',
                    'duration' => $faker->randomFloat(2, 5, 50),
                    'selling_price' => $faker->numberBetween(50, 200),
                    'discount_price' => $faker->numberBetween(10, 40),
                    'prerequisites' => 'Basic knowledge of ' . $subcategory->name,
                    'status' => 1,
                    'can_have_quizzes' => 1,
                ]);

                // 4. Enrollments & Orders (Create 10 orders per instructor total)
                $orders_to_create = ($i == 5) ? 2 : 2; // Simple math for 10 orders: 2*5 = 10
                for ($o = 1; $o <= $orders_to_create; $o++) {
                    $student = $students[array_rand($students)];
                    
                    $payment = Payment::create([
                        'transaction_id' => 'TRANS_' . strtoupper(Str::random(10)),
                        'name' => $student->name,
                        'email' => $student->email,
                        'total_amount' => $course->selling_price,
                        'payment_type' => 'Razorpay',
                        'invoice_no' => 'INV_' . time() . rand(100, 999),
                        'order_date' => now()->subDays(rand(1, 30))->format('d F Y'),
                        'status' => 'confirmed',
                    ]);

                    Order::create([
                        'payment_id' => $payment->id,
                        'user_id' => $student->id,
                        'course_id' => $course->id,
                        'instructor_id' => $instructor->id,
                        'course_title' => $course->course_title,
                        'price' => $course->selling_price,
                    ]);

                    Enrollment::updateOrCreate([
                        'user_id' => $student->id,
                        'course_id' => $course->id,
                    ], [
                        'amount' => $course->selling_price,
                        'status' => 'active',
                    ]);
                }

                // 5. Reviews (Create 15 reviews per instructor total)
                $reviews_to_create = 3; // 3*5 = 15 total
                for ($r = 1; $r <= $reviews_to_create; $r++) {
                    $is_good = (rand(1, 10) > 3);
                    Review::create([
                        'course_id' => $course->id,
                        'user_id' => $students[array_rand($students)]->id,
                        'comment' => $is_good ? $review_comments_good[array_rand($review_comments_good)] : $review_comments_bad[array_rand($review_comments_bad)],
                        'rating' => $is_good ? rand(4, 5) : rand(2, 3),
                        'status' => 1,
                    ]);
                }

                // Add Course Sections, Lectures, Goals for each course
                CourseGoal::where('course_id', $course->id)->delete();
                for ($g = 1; $g <= 3; $g++) {
                    CourseGoal::create([
                        'course_id' => $course->id,
                        'goal_name' => 'Goal ' . $g . ': Master ' . $subcategory->name . ' core concepts.',
                    ]);
                }

                for ($s = 1; $s <= 2; $s++) {
                    $section = CourseSection::updateOrCreate([
                        'course_id' => $course->id,
                        'section_title' => 'Section ' . $s . ': ' . ($s == 1 ? 'Introduction to ' : 'Advanced ') . $subcategory->name,
                    ], ['display_order' => $s]);

                    for ($l = 1; $l <= 3; $l++) {
                        CourseLecture::updateOrCreate([
                            'course_id' => $course->id,
                            'section_id' => $section->id,
                            'lecture_title' => 'Lecture ' . $l . ' - Learning ' . $subcategory->name . ' Step ' . $l,
                        ], [
                            'url' => $yt_link,
                            'video_duration' => rand(10, 30),
                            'display_order' => $l,
                        ]);
                    }

                    // Add 1 or 2 quizzes per course (distributed across sections)
                    $total_quizzes_needed = rand(1, 2);
                    $quizzes_created = Quiz::where('course_id', $course->id)->count();
                    
                    if ($quizzes_created < $total_quizzes_needed && ($s == 1 || rand(0, 1))) {
                        $quiz = Quiz::updateOrCreate([
                            'course_id' => $course->id,
                            'section_id' => $section->id,
                            'quiz_title' => 'Quiz: ' . $subcategory->name . ' - ' . ($quizzes_created == 0 ? 'Basics' : 'Advanced'),
                        ], [
                            'description' => 'Test your knowledge on ' . $subcategory->name . ' (Course ID: ' . $course->id . ')',
                            'duration_minutes' => 10,
                            'pass_mark' => 80,
                            'display_order' => 1,
                            'is_active' => 1,
                        ]);

                        $questions_data = [
                            ['q' => 'What is the primary role of ' . $subcategory->name . '?', 'a' => 'Solving key problems in ' . $subcategory->category->name],
                            ['q' => 'True or False: ' . $subcategory->name . ' is widely used in 2025.', 'a' => 'True'],
                            ['q' => 'Which feature is most important in ' . $subcategory->name . '?', 'a' => 'Flexibility'],
                        ];

                        foreach ($questions_data as $qkey => $qdata) {
                            QuizQuestion::create([
                                'quiz_id' => $quiz->id,
                                'question_text' => $qdata['q'] . ' (Sec ' . $s . ' | ID ' . $course->id . ')',
                                'option_a' => $qdata['a'],
                                'option_b' => 'Alternative B',
                                'option_c' => 'Alternative C',
                                'option_d' => 'Alternative D',
                                'correct_answer' => 'option_a',
                                'explanation' => 'Conceptual explanation of ' . $qdata['a'],
                            ]);
                        }
                    }

                    // Add 2 or 3 materials per course (distributed)
                    $total_materials_needed = rand(2, 3);
                    $materials_created = CourseMaterial::where('course_id', $course->id)->count();
                    
                    if ($materials_created < $total_materials_needed) {
                        $remaining = $total_materials_needed - $materials_created;
                        for ($m = 1; $m <= $remaining; $m++) {
                            CourseMaterial::create([
                                'course_id' => $course->id,
                                'section_id' => $section->id,
                                'material_title' => 'Master Guide ' . ($materials_created + $m) . ' - ' . $subcategory->name,
                                'type' => ($m % 2 == 0) ? 'pdf' : 'link',
                                'file_path' => 'upload/material/sample.pdf',
                                'external_url' => $yt_link,
                                'display_order' => ($materials_created + $m),
                            ]);
                        }
                    }
                }

                // Add Course Questions and Answers (3-4 questions per course)
                $questions_already_created = CourseQuestion::where('course_id', $course->id)->whereNull('parent_id')->count();
                
                if ($questions_already_created == 0) {
                    $question_templates = [
                        [
                            'q' => 'I\'m having trouble understanding the core concepts of ' . $subcategory->name . '. Can you please explain the fundamentals in simpler terms?',
                            'a' => 'Great question! The fundamentals of ' . $subcategory->name . ' are actually quite straightforward once you break them down. I recommend reviewing the first lecture again and practicing with the provided examples. The key is to understand the basics before moving to advanced topics. Let me know if you need clarification on any specific part!'
                        ],
                        [
                            'q' => 'What are the best practices for implementing ' . $subcategory->name . ' in real-world projects?',
                            'a' => 'Excellent question! When implementing ' . $subcategory->name . ' in production, always follow these best practices: 1) Start with a solid foundation, 2) Keep your code clean and maintainable, 3) Test thoroughly before deployment, and 4) Stay updated with the latest industry standards. I\'ve covered detailed examples in the advanced section of this course.'
                        ],
                        [
                            'q' => 'Are there any prerequisites I should know before diving deep into ' . $subcategory->name . '?',
                            'a' => 'Good thinking ahead! While the course is designed for beginners, having basic knowledge of ' . $subcategory->category->name . ' will definitely help you grasp the concepts faster. I\'ve included a prerequisites checklist in the course materials. Don\'t worry if you\'re completely new - just follow the lectures in order and you\'ll be fine!'
                        ],
                        [
                            'q' => 'How long will it take to master ' . $subcategory->name . ' with this course?',
                            'a' => 'That\'s a common question! The time varies based on your background and dedication. Most students complete this course in 4-6 weeks with consistent practice. However, true mastery comes with hands-on project experience. I recommend spending at least 2-3 hours daily on the course content and practice exercises. Keep building projects and you\'ll see steady progress!'
                        ],
                        [
                            'q' => 'Can you recommend any additional resources or projects to practice ' . $subcategory->name . '?',
                            'a' => 'Absolutely! Besides this course, I recommend working on real-world projects. Start with small projects and gradually increase complexity. Check out the course materials section where I\'ve shared some excellent resources and project ideas. Also, joining online communities related to ' . $subcategory->name . ' can be very beneficial for learning and networking.'
                        ]
                    ];

                    // Create 3-4 random questions for this course
                    $num_questions = rand(3, 4);
                    $selected_questions = array_rand($question_templates, $num_questions);
                    
                    // Ensure it's always an array (array_rand returns int if count is 1)
                    if (!is_array($selected_questions)) {
                        $selected_questions = [$selected_questions];
                    }

                    foreach ($selected_questions as $q_index) {
                        $q_data = $question_templates[$q_index];
                        
                        // Pick a random student to ask the question
                        $random_student = $students[array_rand($students)];
                        
                        // Get a random lecture from this course for context
                        $random_lecture = CourseLecture::where('course_id', $course->id)->inRandomOrder()->first();
                        
                        // Create the question
                        $question = CourseQuestion::create([
                            'course_id' => $course->id,
                            'user_id' => $random_student->id,
                            'lecture_id' => $random_lecture ? $random_lecture->id : null,
                            'parent_id' => null,
                            'question' => $q_data['q'],
                            'is_instructor_reply' => false,
                            'created_at' => now()->subDays(rand(1, 15)),
                            'updated_at' => now()->subDays(rand(1, 15)),
                        ]);

                        // Create instructor's answer
                        CourseQuestion::create([
                            'course_id' => $course->id,
                            'user_id' => $instructor->id,
                            'lecture_id' => $random_lecture ? $random_lecture->id : null,
                            'parent_id' => $question->id,
                            'question' => $q_data['a'],
                            'is_instructor_reply' => true,
                            'created_at' => now()->subDays(rand(0, 14)),
                            'updated_at' => now()->subDays(rand(0, 14)),
                        ]);
                    }
                }
            }
        }

        // 6. Sliders
        Slider::where('id', '>', 0)->delete();
        for ($sl = 1; $sl <= 3; $sl++) {
            Slider::create([
                'title' => 'Unlock Your Potential with Our Expert Courses',
                'short_description' => 'Join over 10,000 students learning from top professionals.',
                'video_url' => 'https://www.youtube.com/watch?v=dQw4w9WgXcQ',
                'image' => 'upload/slider/slider_' . $sl . '.jpg',
            ]);
        }

        // 7. Info Boxes
        InfoBox::where('id', '>', 0)->delete();
        $info_icons = ['bi-people', 'bi-mortarboard', 'bi-play-circle', 'bi-award'];
        $info_titles = ['Expert Instructors', 'Lifetime Access', 'Quality Content', 'Certificate of Completion'];
        for ($ib = 0; $ib < 4; $ib++) {
            InfoBox::create([
                'icon' => $info_icons[$ib],
                'title' => $info_titles[$ib],
                'description' => 'We provide the best resources for your learning journey.',
            ]);
        }

        // 8. Partners
        Partner::where('id', '>', 0)->delete();
        for ($p = 1; $p <= 6; $p++) {
            Partner::create([
                'name' => 'Partner ' . $p,
                'image' => 'upload/partner/partner_' . $p . '.png',
            ]);
        }

        // 9. Site Info
        SiteInfo::updateOrCreate([
            'id' => 1
        ], [
            'meta_title' => 'SkillPoint - Online Learning Management System',
            'meta_description' => 'Empower your future with quality online education.',
            'copyright' => '© 2025 SkillPoint. All Rights Reserved.',
            'logo' => 'upload/site/logo.png',
            'favicon' => 'upload/site/favicon.png',
            'address' => '123 Learning Ave, Knowledge City',
            'phone' => '+1 (555) 123-4567',
            'mail' => 'info@skillpoint.com',
            'facebook' => 'https://facebook.com/skillpoint',
            'twitter' => 'https://twitter.com/skillpoint',
            'instagram' => 'https://instagram.com/skillpoint',
            'linkedin' => 'https://linkedin.com/company/skillpoint',
        ]);

        $this->command->info('Real data seeded successfully with Instructor panel data!');
    }
}
