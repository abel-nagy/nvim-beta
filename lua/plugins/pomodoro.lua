local opts = {
    sessions = {
        pomodoro = {
            { name = 'Work', duration = '50m' },
            { name = 'Short break', duration = '5m' },
            { name = 'Work', duration = '50m' },
            { name = 'Short break', duration = '5m' },
            { name = 'Work', duration = '50m' },
            { name = 'Short break', duration = '5m' },
            { name = 'Work', duration = '45m' },
            { name = 'Long break', duration = '30m' }
        },
        pomo = {
            { name = 'Work', duration = '50m' },
            { name = 'Break', duration = '10m' },
        }
    },
    notifiers = {
        {
            name = "Default",
            opts = {
                sticky = false,
                title_icon = "󱎫",
                text_icon = "󰄉",
            },
        },

        -- The "System" notifier sends a system notification when the timer is finished.
        -- Available on MacOS and Windows natively and on Linux via the `libnotify-bin` package.
        { name = "System" },
    },
}
require('pomo').setup(opts)
