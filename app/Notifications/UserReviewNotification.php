<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class UserReviewNotification extends Notification
{
    use Queueable;

    protected $review;

    /**
     * Create a new notification instance.
     */
    public function __construct($review)
    {
        $this->review = $review;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['database'];
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            'user_id' => $this->review->user_id,
            'name' => $this->review->user->name,
            'photo' => $this->review->user->photo,
            'course_id' => $this->review->course_id,
            'course_title' => $this->review->course->course_name,
            'rating' => $this->review->rating,
            'message' => 'New Review from ' . $this->review->user->name . ' for course: ' . $this->review->course->course_name,
            'link' => route('instructor.all.review'),
        ];
    }
}
