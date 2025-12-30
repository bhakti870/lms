<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class WelcomeNotification extends Notification
{
    use Queueable;

    protected $user;

    /**
     * Create a new notification instance.
     */
    public function __construct($user)
    {
        $this->user = $user;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['mail', 'database'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {
        return (new MailMessage)
                    ->subject('Welcome to SkillPoint! 🎉')
                    ->greeting('Hello ' . $this->user->name . '!')
                    ->line('Thank you for joining SkillPoint. We are excited to have you on board!')
                    ->line('Start your learning journey by browsing our wide range of courses.')
                    ->action('Go to Dashboard', route('user.dashboard'))
                    ->line('If you have any questions, feel free to reply to this email.')
                    ->line('Happy Learning!')
                    ->salutation('Best Regards, The SkillPoint Team');
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            'title' => 'Welcome to SkillPoint! 👋',
            'message' => 'Your account has been created successfully. Welcome to our learning community!',
            'link' => route('user.dashboard'),
            'type' => 'general',
            'icon' => 'bi-stars',
            'color' => 'success',
        ];
    }
}
