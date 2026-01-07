<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class UserNotification extends Notification
{
    use Queueable;

    protected $details;

    /**
     * Create a new notification instance.
     * 
     * @param array $details Must contain 'title', 'message', 'link', and optionally 'type'
     */
    public function __construct($details)
    {
        $this->details = $details;
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
            'title' => $this->details['title'],
            'message' => $this->details['message'],
            'link' => $this->details['link'],
            'type' => $this->details['type'] ?? 'general',
            'icon' => $this->details['icon'] ?? 'bi-bell',
            'color' => $this->details['color'] ?? 'primary',
        ];
    }
}
