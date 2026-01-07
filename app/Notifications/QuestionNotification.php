<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class QuestionNotification extends Notification
{
    use Queueable;

    protected $question;

    /**
     * Create a new notification instance.
     */
    public function __construct($question)
    {
        $this->question = $question;
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
            'user_id' => $this->question->user_id,
            'name' => $this->question->user->name,
            'photo' => $this->question->user->photo,
            'course_id' => $this->question->course_id,
            'course_title' => $this->question->course->course_name,
            'message' => 'New Question from ' . $this->question->user->name . ' for course: ' . $this->question->course->course_name,
            'link' => route('instructor.question.show', $this->question->id),
        ];
    }
}
