# shPAGETTI

This package provides pomodoro timer with time tracking functionality in terminal.
All events are logged into *.log.md files separated by days. Entries are formatted in markdown to make them berret readable with naked eye.
You can also simply make a 

When you finish early with the task you can write down what was the reason of premature finish.

## How it works
Example of use:
``` bash
$ shpagetti -t 30 -m "Coding new javascript framework"
```

What parameters can be set:
```
-t|--time
    Time in minutes. In case time is not set system will ask you in next step.
-m|--message
    Description of what you plan to do.
-l|--log
    Overwrite default log path.
```

Format of the log
```
# _{{ CURR_DATE } {{ CURR_TIME }}_   **{{ USER_MESSAGE }}**    {{ STATUS_MESSAGE }}
_2023-02-01 10:00_    **Coding new javascript framework**    Timer(30m) started
```


## How to install
Change permissions to allow run directly
```bash
$ chmod +x shpagetti
```
or create alias in `/usr/local/bin`

### Mac OS
```bash
$ brew install terminal-notifier
$ brew install caarlos0/tap/timer
```

### Linux
```bash
$ echo 'deb [trusted=yes] https://repo.caarlos0.dev/apt/ /' | sudo tee /etc/apt/sources.list.d/caarlos0.list
$ sudo apt update
$ sudo apt install timer
$ sudo apt install notify-send
```
