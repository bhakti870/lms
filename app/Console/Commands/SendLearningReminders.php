<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;
use App\Models\CourseProgress;
use App\Notifications\UserNotification;
use Carbon\Carbon;

class SendLearningReminders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'lms:send-reminders';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Send various learning reminders to users (Daily Study, Revision, Inactive)';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $users = User::where('role', 'user')->get();

        foreach ($users as $user) {
            // 1. Inactive User Alert (3 days idle)
            $lastActivity = CourseProgress::where('user_id', $user->id)->latest('completed_at')->first();
            if ($lastActivity && Carbon::parse($lastActivity->completed_at)->diffInDays(now()) == 3) {
                $user->notify(new UserNotification([
                    'title' => 'We miss you! 👋',
                    'message' => 'You haven’t studied in 3 days. Let’s continue your learning journey!',
                    'link' => route('user.dashboard'),
                    'type' => 'alert',
                    'icon' => 'bi-emoji-frown',
                    'color' => 'warning',
                ]));
            }

            // 2. Revision Reminder (Lesson learned 7 days ago)
            $weekAgoLessons = CourseProgress::where('user_id', $user->id)
                ->whereDate('completed_at', now()->subDays(7))
                ->get();
            
            if ($weekAgoLessons->count() > 0) {
                $user->notify(new UserNotification([
                    'title' => 'Time to Revise! 🧠',
                    'message' => 'You learned something 7 days ago. A quick revision helps with long-term memory!',
                    'link' => route('user.dashboard'),
                    'type' => 'revision',
                    'icon' => 'bi-arrow-clockwise',
                    'color' => 'info',
                ]));
            }

            // 3. Daily Study Reminder
            // (In a real app, you'd check if they've studied today)
            $studiedToday = CourseProgress::where('user_id', $user->id)
                ->whereDate('completed_at', now())
                ->exists();
            
            if (!$studiedToday) {
                $user->notify(new UserNotification([
                    'title' => 'Daily Learning Goal 🎯',
                    'message' => 'Today’s learning goal is pending – complete your lesson to maintain your streak!',
                    'link' => route('user.dashboard'),
                    'type' => 'reminder',
                    'icon' => 'bi-lightning-charge-fill',
                    'color' => 'secondary',
                ]));
            }
        }

        $this->info('Learning reminders sent successfully.');
    }
}
