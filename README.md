# Local Notification Hacking with Swift
Send reminders, prompts and alerts even when your app isn't running.

#Topics:
UNUserNotificationCenter, UNNotificationRequest, UNMutableNotificationContent, UNCalendarNotificationTrigger, and UNTimeIntervalNotificationTrigger

# Challenges 

# Challenge

1- Update the code in didReceive so that it shows different instances of UIAlertController depending on which action identifier was passed in.

2- For a harder challenge, add a second UNNotificationAction to the alarm category of project 21. Give it the title “Remind me later”, and make it call scheduleLocal() so that the same alert is shown in 24 hours. (For the purpose of these challenges, a time interval notification with 86400 seconds is good enough – that’s roughly how many seconds there are in a day, excluding summer time changes and leap seconds.)

3- And for an even harder challenge, update project 2 so that it reminds players to come back and play every day. This means scheduling a week of notifications ahead of time, each of which launch the app. When the app is finally launched, make sure you call removeAllPendingNotificationRequests() to clear any un-shown alerts, then make new alerts for future days.

# Screenshots:

<img width="299" alt="Screenshot 2023-01-15 at 18 43 49" src="https://user-images.githubusercontent.com/79315087/212559597-6848f6e0-7b6d-4572-b81c-b4c7685a3e2d.png"><img width="300" alt="Screenshot 2023-01-15 at 18 44 40" src="https://user-images.githubusercontent.com/79315087/212559598-84d132bf-fe72-4844-9e17-eb846bced6e7.png">
<img width="304" alt="Screenshot 2023-01-15 at 18 45 10" src="https://user-images.githubusercontent.com/79315087/212559600-c819eba5-840f-4b02-bc85-d1e82bd3a1c0.png"><img width="303" alt="Screenshot 2023-01-15 at 18 45 58" src="https://user-images.githubusercontent.com/79315087/212559602-581c2e96-a87e-436b-a2c5-ae1e8ee4f525.png">
