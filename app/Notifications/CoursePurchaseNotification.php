<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class CoursePurchaseNotification extends Notification
{
    use Queueable;

    protected $order;

    /**
     * Create a new notification instance.
     */
    public function __construct($order)
    {
        $this->order = $order;
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
            'user_id' => $this->order->user_id,
            'name' => $this->order->user->name,
            'photo' => $this->order->user->photo,
            'course_id' => $this->order->course_id,
            'course_title' => $this->order->course_title,
            'amount' => $this->order->price,
            'message' => 'Course Purchased: ' . $this->order->course_title . ' by ' . $this->order->user->name,
            // 'link' => route('instructor.order.details', $this->order->id), // Link if we have a specific order page for instructors
        ];
    }
}
