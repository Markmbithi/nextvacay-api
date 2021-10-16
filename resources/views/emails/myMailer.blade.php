@component('mail::message')

# {{ $details['title'] }}
Hello, to finish logging in please click the link below

@component('mail::button', ['url' => $details['url']])
Click to Login
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent